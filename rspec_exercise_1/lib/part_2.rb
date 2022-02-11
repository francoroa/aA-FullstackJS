def hipsterfy(string)
    i = string.rindex(/[aeiou]/)
    if i != nil
        string[0...i] + string[i+1..-1]
    else
        string
    end
end

def vowel_counts(string)
    hash = Hash.new(0)
    vowels = "aeiou"
    string.each_char do |char|
        if vowels.include? char.downcase
            hash[char.downcase] += 1
        end
    end
    hash
end

def caesar_cipher(string, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""

    string.each_char do |char|
        if alphabet.include? char
            nidx = alphabet.index(char) + num
            new_str += alphabet[nidx % 26]
        else
            new_str += char
        end
    end

    new_str
end
