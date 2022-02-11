
require "byebug"

def my_map(array, &prc)
    new_array = []
    array.each do 
        |each| new_array << prc.call(each) 
    end
    new_array
end

def my_select(array, &prc)
    new_array = []
    array.each do |each| 
        if prc.call(each) == true
            new_array << each
        end
    end
    new_array    
end

def my_count(array, &prc)
    count = 0
    array.each do |each| 
        if prc.call(each) == true
            count += 1
        end
    end
    count
end

def my_any?(array, &prc)
    array.each do |each| 
        if prc.call(each) 
            return true
        end
    end
    false
end

def my_all?(array, &prc)
    array.each do |each| 
        if prc.call(each) == false
            return false
        end
    end
    true
end

def my_none?(array, &prc)
    array.each do |each| 
        if prc.call(each) == true
            return false
        end
    end
    true
end

p my_none?([3, 5, 4, 7, 11]) { |n| n.even? } 