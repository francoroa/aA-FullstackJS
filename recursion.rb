def sum_to(n)
    return 1 if n == 1 
    return nil if n < 0
    n + sum_to(n-1)
end

def add_numbers(nums_array)
    return nums_array[0] if nums_array.length == 1 
    return nil if nums_array.empty?

    nums_array[0] + add_numbers(nums_array[1..-1])

end

def gamma_fnc(num)
    return nil if num == 0
    return 1 if num == 1

    num-1 * gamma_fnc(num-1)

end

p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040