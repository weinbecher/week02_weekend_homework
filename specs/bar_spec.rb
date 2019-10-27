require("minitest/autorun")
require('minitest/rg')
require("pry")
require_relative("../bar")

class BarTest < MiniTest::Test

  def setup
    @bar1 = Bar.new(90.00)
  end

# first two test, get the two values back.
  def test_bar_has_tab
    assert_equal(90.00, @bar1.tab)
  end

end
