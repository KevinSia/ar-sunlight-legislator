class Sen < Legislator
  # single table inheritance
  # instead of doing Legislator.where(title: 'Sen')
  # able to do Sen.all (cleaner)
  self.inheritance_column = 'title'
end