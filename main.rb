require_relative 'db/config'

def print_states_rep_and_sen(state)
  puts "A state's Representatives and Senators"

  puts "Senator: "
  Senator.in_state(state).each do |s|
    puts "\ \ #{s.firstname} #{s.lastname} (#{s.party})"
  end

  puts "\nRepresentative: "
  Representative.in_state(state).each do |r|
    puts "\ \ #{r.firstname} #{r.lastname} (#{r.party})"
  end
end

# 1.
state = 'CA'
states_rep_and_sen(state)
puts

def gender_rep_and_sen(gender)
  puts "Gender"

  total_count = Legislator.where(gender: gender).count
  sen_count = Senator.with_gender(gender).count
  rep_count = Representative.with_gender(gender).count

  puts "Male Senators: #{sen_count} (#{(sen_count/total_count.to_f * 100).round(0)}%)"
  puts "Male Representative: #{rep_count} (#{(rep_count/total_count.to_f * 100).round(0)}%)"
end

# 2.
gender = "M"
gender_rep_and_sen(gender)
puts

def list_of_states
  puts "List of states"
  Legislator.sorted_states_string.each do |key, value|
    puts "#{key}: #{value}"
  end
end

# 3.
list_of_states

# 4.
puts "\nTotal Senator and Representative"
puts "Senator: #{Senator.count}"
puts "Representative: #{Representative.count}"

# 5.
puts "\nTotal Senator and Representative in office"
puts "Senator: #{Senator.in_office.count}"
puts "Representative: #{Representative.in_office.count}"
