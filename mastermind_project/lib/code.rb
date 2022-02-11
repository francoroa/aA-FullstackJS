class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.map(&:upcase).all?{ |e| POSSIBLE_PEGS.keys.include?(e) }
  end

  attr_reader :pegs

  def initialize(chars)
    if Code.valid_pegs? chars
      @pegs = chars.map(&:upcase)
    else
      raise "Invalid pegs."
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    random = []
    length.times do random << POSSIBLE_PEGS.keys.sample
    end
    Code.new(random)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    h1 = Hash.new
    h2 = Hash.new
    guess.pegs.each_with_index do |el, idx|
      h1[idx] = el
    end
    self.pegs.each_with_index do |el, idx|
      h2[idx] = el
    end
    h1.keep_if {| key, value | h2[key] == value }
    return h1.length    
  end

  def num_near_matches(guess)
    h1 = Hash.new
    h2 = Hash.new

    guess.pegs.each_with_index { |el, idx| h1[idx] = el}
    self.pegs.each_with_index { |el, idx| h2[idx] = el}
    
    h1_dup = h1.dup
    h1.delete_if {| key, value | h2[key] == value }

    appeared = []
    count = 0

    h2.delete_if {| key, value | h1_dup[key] == value }

    h1.each_value do |value| 
      if h2.has_value?(value) and !appeared.include? value
        appeared << value
        count += 1
      end
    end
    count

  end

  def ==(other_code)
    self.length == other_code.length && self.num_exact_matches(other_code) == self.length
  end
  
end
