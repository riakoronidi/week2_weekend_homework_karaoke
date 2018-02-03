require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Ria",20, "I lose control")
    @guest = Guest.new("Chris",20, "Thunderstruck")
    @guest = Guest.new("Zoi",20, "La isla bonita")
  end

end
