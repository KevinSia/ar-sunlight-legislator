class Senator < Legislator
  # - Single table inheritance -
  # instead of doing Legislator.where(title: 'Sen')
  # able to do Senator.all (cleaner)
  self.inheritance_column = 'title'

  class << self
    def find_sti_class(type_name)
      type_name = self.name
      super
    end

    def sti_name
      "Rep"
    end
  end
end
