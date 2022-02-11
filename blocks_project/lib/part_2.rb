def all_words_capitalized?(array)
    array.all? {|x| x.capitalize == x } 
end

def no_valid_url?(array)
    array.none? {|x| x.end_with?(".com", ".net", ".io", ".org") } 
end

def any_passing_students?(array)
    array.any? { |each| each[:grades].sum(0.0)/each[:grades].length > 75}
end
