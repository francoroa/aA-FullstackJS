# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    def span
        return nil if self == []
        self.max - self.min
    end

    def average
        return nil if self == []
        self.sum(0.0) / self.length
    end

    def median
        return nil if self == []
        self.sort!
        length = self.length
        if length % 2 == 0
            (self[length/2] + self[(length/2)-1])/2.0
        else
            self[(length-1)/2]
        end

    end

    def counts
        hash = Hash.new(0)
        self.each {|each| hash[each] += 1}
        hash
    end

    def my_count(number)
        count = 0
        self.each do |each|
            if each == number
                count += 1
            end
        end
        count
    end

    def my_index(number)
        return nil if !self.include? number
        (0...self.length).each do |each|
            if self[each] == number
                return each
            end
        end
    end

    def my_uniq
        appeared = []
        self.each_with_index do |each, i|
            if self[i] != self[i+1] and !appeared.include? self[i]
                appeared << self[i]
            end
        end
        appeared
    end

    def my_transpose
        new = []
        (0...self.length).each do |each|
            temp = []
            (0...self.length).each do |each2|
                temp << self[each2][each]
            end
            new << temp
        end
        new
    end
end

