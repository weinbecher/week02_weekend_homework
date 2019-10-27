require("minitest/autorun")
require('minitest/rg')
require("pry")

require_relative("../songs")

class SongsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("I should be lucky")
  end

# first two test, get the two values back.
  def test_song_has_name
    assert_equal("I should be lucky", @song1.name)
  end

end
