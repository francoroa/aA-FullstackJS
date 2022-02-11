
require "byebug"

def get_matching_indices(char, string)
    hash = Hash.new {|h, k| h[k] = []}
    debugger
    string.each_char.with_index do |c , i| 
      hash[c] << i
    end
    hash[char]
end

p get_matching_indices("c","cocacola")