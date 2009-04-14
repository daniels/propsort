#!/opt/local/bin/ruby

require 'rubygems'
require 'property_list'

my_file = ARGV.shift
their_file = ARGV.shift

my_d = File.open(my_file) do |my|
  PropertyList.parse(my)
end
  
their_d = File.open(their_file) do |their|
  PropertyList.parse(their)
end 

result_d = their_d.merge(my_d)
result = PropertyList.build(result_d)

puts result
