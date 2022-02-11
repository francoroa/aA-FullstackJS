def partition(array, num)
    arr = []
    arr << array.select { |each|  each < num  }
    arr << array.select { |each|  each >= num  }  
    arr
end 

def merge(hash_1, hash_2)
    hash = Hash.new(0)
    hash_1.each {|key, value| hash[key] = value }
    hash_2.each {|key, value| hash[key] = value }
    hash
end

def censor(string, array)
    ary = string.split
    ary.map! do |ele|
        if array.include? ele.downcase
            ele.gsub(/[AEIOUaeiou]/, '*')
        else
            ele
        end
    end
    ary.join(" ")
end

def power_of_two?(num)
  while (num % 2 == 0 and num != 0)
    num /= 2
  end
  num == 1    
end
