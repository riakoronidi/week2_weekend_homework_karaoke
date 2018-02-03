require('minitest/autorun')
require('minitest/rg')

require_relative("../bar.rb")

class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new(10)
  end

end
