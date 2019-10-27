class Rooms

  attr_reader :name, :till, :capacity, :price, :playlist

  def initialize(name, capacity, price, till)
    @name = name
    @capacity = capacity
    @price = price
    @till = till
    @playlist = []
  end

  def check_in(guest)
    if @capacity >= guest.group_size
    return true
    else
    return false
    end
  end

  def check_out(guest)
    if guest.wallet > @price
      guest.wallet -= @price
      @till += @price
      return true
    else
    return false
    end
  end

  def playlist_count
    @playlist.count
  end

  def add_song(song)
    @playlist.push(song)
  end

  def bill(guest, bar)
    total = 0
    total = @price + guest.bar_tab(bar)
    return total
  end
  #
  # def total_sales
  #   total_sales = 0
  #   for room in Room
  #   total_sales += room.bill(guest, bar)
  #   end
  #   return total_sales
  #
  #
  # end
  #



end
