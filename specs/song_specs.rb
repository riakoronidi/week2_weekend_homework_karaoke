require("minitest/autorun")
require("minitest/rg")

require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Sex Bomb", "POP")
    @song = Song.new("Thunderstruck", "ROCK")
    @song = Song.new("I lose control", "ROCK")
  end




end
