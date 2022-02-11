require "byebug"
def no_dupes?(array)
    h = Hash.new(0)

    array.each do |each|
        h[each] += 1
    end
    
    array.delete_if do |each|
        h[each] > 1
    end

    array
end

def no_consecutive_repeats?(array)
    (0...array.length - 1).each do |i|
        if array[i] == array[i + 1]
            return false
        end
    end
    true
end

def char_indices(str)
    h = Hash.new { |h, k| h[k] = [] }

    str.each_char.with_index do |char, i|
        h[char] << i
    end

    h
end

def longest_streak(str)

    str.gsub(/(.)(\1)*/).to_a.inject do |acc, el|
        if acc.length <= el.length
            el
        else
            acc
        end
    end

end

def bi_prime?(num)
    prime_facts = prime_factors(num)
    prime_facts.any? do |a|
        b = num / a
        prime_facts.include? b
    end
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0}
end

def prime_factors(num)
    (2..num).select { |factor| prime?(factor) and num % factor == 0 }
end

def vigenere_cipher(message, keys)
  alphabet = ("a".."z").to_a
  new_char = ""

  message.each_char.with_index do |char, idx|
    nidx = alphabet.index(char) + keys[idx % keys.length]
    new_char += alphabet[nidx % alphabet.length]
  end
  
  return new_char
  
end

def vowel_rotate(str)
    vowels = "aeiou"
    appeared = []
    new_str = str.dup

    str.each_char.with_index do |char, idx| 
        if vowels.include? char
            appeared << idx
        end
    end
    
    rotate = appeared.rotate(-1)

    appeared.each_with_index do |vowel_idx, i|
        new_str[vowel_idx] = str[rotate[i]]
    end

    return new_str

end

class String
    def select(&prc)
        return "" if prc.nil?
        new_str = ""

        self.each_char do |char|
            new_str += char if prc.call(char)
        end

        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx)
        end
    end
end

def multiply(a, b)
    return 0 if b == 0

    if b.negative?
        -(a + multiply(a, (-b) - 1))
        # a + multiply(a, b + 1)
    else
        a + multiply(a, b-1)
    end

end

def lucas_sequence(num)

    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2

    seq = lucas_sequence(num-1)
    seq << seq[-1] + seq[-2]
    seq

end

def prime_factorization(num)

    (2...num).each do |fact|
        if num % fact == 0
            other = num / fact
            return [*prime_factorization(fact), *prime_factorization(other)]
        end
    end

    [ num ]
end

