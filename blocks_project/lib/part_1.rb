require "byebug"

def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(array)
    array.reject { |each| each["age"] <= 2}
end

def count_positive_subarrays(array)
    array.map!(&:sum)
    array.count { |x| x > 0 }
    # array.count  { |subarr| subarr.sum > 0 }
end

def aba_translate(string)
    string.gsub(/([aeiou])/, '\1b\1')  
    
    # vowels = "aeiou"
    # new_word = ""
    # word.each_char do |char|
    #   if vowels.include? char
    #       new_word += char + "b" + char
    #   else
    #       new_word += char
    #   end
    # end
    #new_word
end

def aba_array(array)
    array.map { |x| aba_translate(x) } 
end
