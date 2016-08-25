require_relative 'db/config'

# alias of class name
Senator = Sen
Representative = Rep

puts "A state's Representatives and Senators"

state = 'CA'
puts "Senator: "
Senator.in_state(state).each do |s|
  puts "\ \ #{s.firstname} #{s.lastname} (#{s.party})"
end

puts "\nRepresentative: "
Representative.in_state(state).each do |r|
  puts "\ \ #{r.firstname} #{r.lastname} (#{r.party})"
end


puts "Gender"
gender = "M"
total_count = Legislator.where(gender: gender).count
sen_count = Senator.with_gender(gender).count
rep_count = Representative.with_gender(gender).count

puts "Male Senators: #{sen_count} (#{(sen_count/total_count.to_f * 100).round(0)}%)"
puts "Male Representative: #{rep_count} (#{(rep_count/total_count.to_f * 100).round(0)}%)"

puts "List of states (not very nice method)"
Legislator.sorted_states_string.each do |key, value|
  puts "#{key}: #{value}"
end

puts "\nTotal Senator and Representative"
puts "Senator: #{Senator.count}"
puts "Representative: #{Representative.count}"

puts "\nTotal Senator and Representative in office"
puts "Senator: #{Senator.in_office.count}"
puts "Representative: #{Representative.in_office.count}"