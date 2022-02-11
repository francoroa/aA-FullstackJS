require_relative "room"

class Hotel
  def initialize(name, capacities)
    @name = name
    @rooms = {}
    capacities.each do |h,k|
        @rooms[h] = Room.new(k)
    end
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms 
  end

  def room_exists?(string)
    @rooms.has_key?(string)
  end

  def check_in(name, room)
    if self.room_exists?(room)
        if self.room_exists?(room) and @rooms[room].add_occupant(name)
            puts "check in successful"
        else 
            puts "sorry, room is full"
        end
    else
        puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.values.any? {|room| room.available_space > 0}
  end

  def list_rooms
    @rooms.each do |h, k| 
        puts "#{h} : #{k.available_space}" 
    end
  end
end
