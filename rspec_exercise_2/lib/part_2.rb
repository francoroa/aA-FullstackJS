def palindrome?(string)
    pal = ""
    string.each_char do |char|
        pal = char + pal
    end
    string == pal
end


def substrings(string)
    
    subs = []

    (0...string.length).each do |first|
        (first...string.length).each do |last|
            subs << string[first..last]
        end
    end
    subs
end

def palindrome_substrings(string)
    pali = substrings(string)
    pali.select { |each| palindrome? each and each.length > 1}
end
