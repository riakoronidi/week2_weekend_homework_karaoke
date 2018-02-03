# require("pry")
class Room

  attr_accessor :name, :capacity, :fee

  def initialize(name, capacity, fee)
    @name = name
    @capacity = capacity
    @fee = fee
    @songs = []
    @guests = []
  end


  def guest_count()
    return @guests.count()
  end


  def check_in_guest(guest,room)
    @guests << guest
    if @guests.count() < room.capacity
      return @guests
    else
      return "Sorry, there is no free space to enter the #{room.name} room"
    end
  end

  # def check_in_guest(guest,room)
  #   @guests << guest
  #   return @guests
  # end


  def check_out_guest(guest)
    @guests.delete(guest)
    return @guests
  end


  def song_count()
    return @songs.count()
  end


  def add_song(song,room)
    if room.name == song.type
      @songs << song
    end
    return @songs
  end



  def pay_fee(guest,room)
    if guest.money > room.fee
      return guest.money - room.fee
    else
      return "not enough money"
    end
  end


  def check_fav_song(guest, song, room)
    if guest.fav_song == song.name
      return "Whoo!"
    end
  end

end
