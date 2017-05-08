class Legislator < ActiveRecord::Base
  # -scopes-
  # allow one to do eg. Legislator.in_state
  # instead of Legislator.where(state: state)
  scope :in_state, -> (state) { where(state: state) }
  scope :with_gender, -> (gender) { where(gender: gender) }
  scope :in_office, -> { where(in_office: true) }

  # using raw sql
  def self.sorted_states
    # how to make it an ActiveRecord::Relation?
    self.find_by_sql("
      SELECT state, title, COUNT(*) AS state_title_count,
      (SELECT COUNT(*) AS state_count FROM legislators y WHERE x.state = y.state GROUP BY state ORDER BY state_count DESC) AS state_count
      FROM legislators x
      WHERE in_office = 't'
      GROUP BY state, title
      ORDER BY title DESC, state_count DESC, state_title_count DESC;
    ")
  end

  def self.sorted_states_string
    hash = Hash.new('')
    sorted_states.each do |x|
      att = x.attributes
      hash[att['state']] += "#{full_title(att['title'])} #{att['state_title_count']} "
    end
    hash
  end

  private

  def self.full_title(title)
    case title
    when 'Rep'
      'Representative'
    when 'Sen'
      'Senator'
    else
      title
    end
  end
end
