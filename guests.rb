class Guests

  attr_reader :name, :wallet, :favourite_song, :group_size, :bar
  attr_writer :wallet

  def initialize(name, wallet, favourite_song, group_size)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @group_size = group_size
  end

  def pay(room)
    @wallet -= room.price
  end

  def go_whoo(song)
    if @favourite_song = song.name
    return "Whoo"
    end
  end

  def bar_tab(bar)
    return bar.tab
  end

end
