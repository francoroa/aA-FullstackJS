require "byebug"

class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
    end

    def my_select(&prc)
        new = []
        self.my_each do |i|
            new << i if prc.call(i)
        end
        new
    end

    def my_reject(&prc)
        new = []
        self.my_each do |i|
            new << i if !prc.call(i)
        end
        new
    end    

    def my_any?(&prc)
        self.my_each do |i|
            return true if prc.call(i)
        end
        false
    end    
    
    def my_all?(&prc)
        self.my_each do |i|
            return false if !prc.call(i)
        end
        true
    end    
    
    def my_flatten

        flattened = []

        self.my_each do |item|
            if item.kind_of? Array
                flattened.concat(item.my_flatten)
            else
                flattened << item
            end
        end

        flattened
    end

    def my_zip(*arrays)
        zipped = []

        self.length.times do |i|
            subzip = [self[i]]

            arrays.my_each do |array|
                subzip << array[i]
            end

            zipped << subzip
        end

        zipped        
    end

  def my_rotate(positions = 1)
    split_idx = positions % self.length

    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(separator = "")
    join = ""

    self.length.times do |i|
      join += self[i]
      join += separator unless i == self.length - 1
    end

    join
  end

  def my_reverse
    reversed = []

    self.my_each do |el|
     reversed.unshift(el)
    end

    reversed
  end
  
end

