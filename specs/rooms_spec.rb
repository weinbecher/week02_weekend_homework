require("minitest/autorun")
require('minitest/rg')
require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")
require_relative("../bar")

require('pry')

class RoomsTest < MiniTest::Test

  def setup
    @song1 = Songs.new("I should be lucky")
    @song2 = Songs.new("Fat bottomed girls")
    @song3 = Songs.new("All by myself")
    @room1 = Rooms.new("Manhattan",30, 100.00, 0.00)
    @room2 = Rooms.new("Hawaii",10, 60.00, 0.00)
    @guest1 = Guests.new("E35", 200.00, "All by myself", 20)
    @guest2 = Guests.new("E34", 50.00, "Fat bottomed girls", 20)
    @guest3 = Guests.new("E33", 300.00, "Fat bottomed girls", 20)

    @bar1 = Bar.new(90.00)
    @bar2 = Bar.new(100.00)


  end


  def test_room_has_name
    assert_equal("Manhattan", @room1.name)
  end

  def test_room_has_capacity
    assert_equal(30, @room1.capacity)
  end

  def test_room_has_price
    assert_equal(100.00, @room1.price)
  end

  def test_room_has_till
    assert_equal(0.00, @room1.till)
  end

  # - Check in guests to rooms/Check out guests from rooms

  def test_check_in
    assert_equal(true, @room1.check_in(@guest1))
  end

  def test_check_out__success
    assert_equal(true, @room1.check_out(@guest1))
    @room1.check_out(@guest1)
    assert_equal(100.00, @guest1.wallet)
    assert_equal(100.00, @room1.till)
    # binding.pry
  end

  # - Add songs to rooms

  def test_playlist_count
    assert_equal(0, @room1.playlist_count)
  end


  def test_add_songs_to_rooms
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    @room1.add_song(@song3)
    assert_equal(3, @room1.playlist_count)
  end

  #
  # - What happens if there are more guests trying to be checked in than there is free space in the room?

  def test_check_in__fail
    assert_equal(false, @room2.check_in(@guest1))
  end


  # - Karaoke venues usually have an entry fee - So the guests could have money so they can pay it.

  def test_check_out__fail
    assert_equal(false, @room1.check_out(@guest2))
  end


  # - Rooms can keep track of the entry fees/spending of the guests - maybe add a bar tab/bar class?

  def test_bill
    assert_equal(190.00, @room1.bill(@guest1,@bar1))
    assert_equal(160.00, @room2.bill(@guest3,@bar2))

  end


  # def test_total_sales
  #   @room1.bill(@guest1,@bar1)
  #   @room2.bill(@guest3,@bar2)
  #   assert_equal(350.00, Rooms.total_sales)
  #
  #
  # end



end
