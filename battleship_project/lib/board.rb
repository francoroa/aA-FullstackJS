class Board

    attr_reader :size

    def initialize(number)
        @grid = Array.new(number) {Array.new(number, :N)}
        @size = number*number
    end

    def [](pos)
        row, col = pos
        return @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count { |x| x == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X 
            return false
        end
    end

    def place_random_ships
        ships = @size * 0.25
        while self.num_ships < ships
            pos = [ rand(0...@grid.length), rand(0...@grid.length) ]
            self[pos]= :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |val|
                if val == :S
                    :N 
                else 
                    val
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |each| 
            puts each.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
