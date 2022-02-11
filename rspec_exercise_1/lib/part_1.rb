 def average(num_1, num_2)
     (num_1.to_f + num_2) / 2
 end
 
 def average_array(array)
     array.sum(0.0) / array.length
 end
 
 def repeat(string, num)

    # string * num
     new = ""
     num.times do
         new += string
     end
     new
 end
 
 def yell(string)
     string.upcase + "!"
 end

 def alternating_case(string)
     alt = string.split
     alt.map!.with_index do |el, i|
         if i % 2 == 0
             el.upcase
         else
             el.downcase
         end
     end
     alt.join(" ")
 end
