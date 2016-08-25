class Rep < Legislator
  # single table inheritance
  # instead of doing Legislator.where(title: 'Rep')
  # able to do Rep.all (cleaner)
  self.inheritance_column = 'title'
end