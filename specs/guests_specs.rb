require("minitest/autorun")
require('minitest/rg')
require_relative("../guests")
require_relative("../rooms")
require_relative("../songs")
require_relative("../bar")


class GuestsTest < MiniTest::Test

  def setup
    @bar1 = Bar.new(90.00)
    @guest1 = Guests.new("E35", 200.00, "All by myself", 20)
    @song1 = Songs.new("I should be lucky")
    @song2 = Songs.new("Fat bottomed girls")
    @song3 = Songs.new("All by myself")
    @room1 = Rooms.new("Manhattan",30, 100.00, 0.00)
  end

  def test_guest_has_name
    assert_equal("E35", @guest1.name)
  end

  def test_guest_has_money
    assert_equal(200.00, @guest1.wallet)
  end


  def test_guest_has_favourite_song
    assert_equal("All by myself", @guest1.favourite_song)
  end

  def test_guest_has_group_size
    assert_equal(20, @guest1.group_size)
  end

  def test_guest_can_pay
    @guest1.pay(@room1)
    assert_equal(100.00, @guest1.wallet)
  end

  # - Guests could have a favourite song, and if their favourite song is on the room's playlist, they can cheer loudly! (return a string like "Whoo!")
  #
  def test_guest_go_whoo
    assert_equal("Whoo", @guest1.go_whoo(@song3))

  end

  def test_guest_has_bar_tab
    assert_equal(90.00, @guest1.bar_tab(@bar1))
  end



end
