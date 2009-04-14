require 'facets/dictionary'

class PropertyList
  attr_accessor :list
  def self.parse(str)
    dictionary = Dictionary.new

    lines = str.reject { |line| /^\s*#/.match(line) || !/=/.match(line) }
    lines.map do |line|
      k, *v = line.chomp.strip.split("=")
      if v
        v = v.join("=").strip
      else
        v = ''
      end
      dictionary << [k.strip, v]
    end
    
    return dictionary
  end
  
  def self.build(hsh)
    hsh.inject('') do |mem, pair|
      mem << pair.join(' = ').strip + "\n"
    end
  end
end