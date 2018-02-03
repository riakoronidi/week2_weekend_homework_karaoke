require("minitest/autorun")
require("minitest/rg")

require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Pop", 5, 5)
    @room = Room.new("Rock", 10, 5)
  end

  def test_add_guests
    room = Room.new("Rock", 3, 5)

    guest1 = Guest.new("Ria", 20, "I lose control")
    guest2 = Guest.new("Chris", 20, "Thunderstruck")

    @room.check_in_guest(guest1,room)
    @room.check_in_guest(guest2,room)

    assert_equal(2, @room.guest_count())
  end


  def test_add_guests_if_no_capacity
    room = Room.new("Rock", 3, 5)

    guest1 = Guest.new("Ria", 20, "I lose control")
    guest2 = Guest.new("Chris", 20, "Thunderstruck")
    guest3 = Guest.new("Zoi", 20, "La isla bonita")

    @room.check_in_guest(guest1,room)
    @room.check_in_guest(guest2,room)
    result = @room.check_in_guest(guest3,room)

    assert_equal("Sorry, there is no free space to enter the #{@room.name} room", result)
  end



  def test_remove_guests
    room = Room.new("Rock", 2, 5)

    guest1 = Guest.new("Ria", 20, "I lose control")
    guest2 = Guest.new("Chris", 20, "Thunderstruck")

    @room.check_in_guest(guest1,room)
    @room.check_in_guest(guest2,room)

    @room.check_out_guest(guest1)
    assert_equal(1, @room.guest_count())
  end


  def test_add_songs_to_room
    room = Room.new("Rock", 10, 5) #2 songs

    song1 = Song.new("Sex Bomb", "Pop")
    song2 = Song.new("Thunderstruck", "Rock")
    song3 = Song.new("I lose control", "Rock")

    songs = @room.add_song(song1,room)
    songs = @room.add_song(song2,room)
    songs = @room.add_song(song3,room)

    assert_equal(2, @room.song_count())
  end


  def test_pay_entry_fee__guest_has_money
    room = Room.new("Rock", 10, 5)

    guest1 = Guest.new("Ria", 20, "I lose control")
    # guest2 = Guest.new("Chris", 20)

    entry = @room.pay_fee(guest1,room)
    assert_equal(15, entry)
  end


  def test_pay_entry_fee__guest_has_no_money
    room = Room.new("Rock", 10, 5)

    guest1 = Guest.new("Leo", 3, "Five Little Ducks")
    # guest2 = Guest.new("Chris", 20)

    entry = @room.pay_fee(guest1,room)
    assert_equal("not enough money", entry)
  end


  def test_favourite_song
    room = Room.new("Rock", 10, 5)

    guest1 = Guest.new("Ria", 20, "I lose control")
    guest2 = Guest.new("Chris", 20, "Thunderstruck")
    guest3 = Guest.new("Zoi", 20, "La isla bonita")

    song1 = Song.new("Sex Bomb", "Pop")
    song2 = Song.new("Thunderstruck", "Rock")
    song3 = Song.new("I lose control", "Rock")

    songs = @room.add_song(song1,room)
    songs = @room.add_song(song2,room)
    songs = @room.add_song(song3,room)

    @room.check_in_guest(guest1,room)
    @room.check_in_guest(guest2,room)
    @room.check_in_guest(guest3,room)

    result = @room.check_fav_song(guest2, song2, room)

    assert_equal("Whoo!",result)

  end

end
