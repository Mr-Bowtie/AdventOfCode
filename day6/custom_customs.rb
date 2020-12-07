# INPUT: a list of strings
#   - groups are seperated by a blank line
#   - individuals in that group are seperated by a new line
#   - each persons string represents which questions on a form they answered yes to
# OUTPUT: an integer
#   - represents the sum of unique responses from each group
# RULES:
#   - first the sum of each groups unique responses is calculated
#   - then the sum of those totals is calculated
#   - among groups, duplicate answers do not add to the total
# ALGORITHM:
#     - seperate file into groups
#       - each group is an array
#         - each person is an array inside that array
#     - for each group, combine all person arrays
#     - narrow that group array to only unique values.
#     - calculate the number of elements in that unique array
#     - sum the total of all groups

#* -------------- Part 1 ----------------

# file = "input.txt"
# batch_data = File.open(file).read
# groups = batch_data.split(/\n\n/).map { |group| group.split("\n") }

# groups.each do |group|
#   index = groups.index(group)
#   groups[index] = group.reduce(&:+).chars.uniq
# end

# p groups.reduce(0) { |memo, el| memo + el.length }

#* -------------- Part 2 ----------------

file = "input.txt"
batch_data = File.open(file).read
groups = batch_data.split(/\n\n/).map { |group| group.split("\n") }
groups.each do |group|
  index = groups.index(group)
  group = group.map { |person| person.chars.sort }
  groups[index] = group.reduce { |memo, person| memo.intersection(person) }
end
p groups.reduce(0) { |memo, group| memo + group.size }
