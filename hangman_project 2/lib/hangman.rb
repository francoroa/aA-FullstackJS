
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include? char
      true
    else
      false
    end
  end

  def get_matching_indices(char)
    hash = Hash.new {|h, k| h[k] = []}
    @secret_word.each_char.with_index do |c, i| 
      hash[c] << i
    end
    hash[char]
  end

  def fill_indices(char, array)
    array.each do |each|
      @guess_word[each] = char
    end
  end

  def try_guess(char)
  
    if self.already_attempted?(char)
      print 'that has already been attempted'
      return false
    end

    @attempted_chars << char
    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)

    if matches.empty?
      @remaining_incorrect_guesses -= 1
    end

    true

  end

  def ask_user_for_guess
    print "Enter a char"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? or self.lose?
      print @secret_word
      return true
    end
    false
  end
end
