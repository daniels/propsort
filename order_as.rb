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

my_keys = my_d.keys
their_keys = their_d.keys

my_d.order_by do |k,v|
  their_keys.index(k) || their_keys.length + my_keys.index(k)
end

result = PropertyList.build(my_d)

puts result
