# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def prime?(value) 
    return false if value < 2
    (2...value).each do |ele|
        if value % ele == 0
            return false
        end
    end
    return true
end

def largest_prime_factor(num)
    array = (2..num).select { |each| prime?(each) and num % each == 0} 
    array.max
end 

def unique_chars?(string)
    hash = Hash.new(0)
    string.each_char {|c| hash[c.downcase] += 1}
    return false if hash.values.max >= 2 else return true 
end

def dupe_indices(array)
    hash = Hash.new { |h,k| h[k] = [ ] }
    array.each_with_index { | ele, idx | hash[ele] << idx }
    hash.delete_if {|key, value| value.length < 2 }
end

def ana_array(arr_1 , arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    arr_1.each {|ele| hash_1[ele] += 1}
    arr_2.each {|ele| hash_2[ele] += 1}

    return hash_1 == hash_2

end

