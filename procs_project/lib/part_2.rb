require "byebug"

def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    words = string.split
    words.map! { |word| prc.call(word) }
    words.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    if proc_1.call(num) > proc_2.call(num) 
        return proc_1.call(num)
    else
        return proc_2.call(num) 
    end
end

def and_selector(array, proc_1, proc_2)
    new_array = array.map do |each| 
        if proc_1.call(each) == true and proc_2.call(each) == true
            each
        end
    end
    new_array.compact
end

def alternating_mapper(array, proc_1, proc_2)
    debugger
    new_array = array.each_with_index.map do |each, i| 
        if i == 0 or i % 2 == 0
            proc_1.call(each)
        else 
            proc_2.call(each) 
        end
    end
    new_array    
end

half = Proc.new { |n| n / 2.0 }
times_thousand = Proc.new { |n| n * 1000 }
p alternating_mapper([1,10,4,7,5], half, times_thousand)
