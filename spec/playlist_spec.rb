require("minitest/autorun")
require("minitest/rg")
require_relative("../playlist")
require_relative("../song")

class TestPlaylist < MiniTest::Test

  def setup
    @playlist = Playlist.new()
  end

  def test_start_with_empty_playlist
    assert_equal([], @playlist.songs)
  end

  def test_adding_songs_individually
    song1 = Song.new("I will survive")
    song2 = Song.new("My way")
    song3 = Song.new("It's raining men")
    @playlist.add_song(song1)
    @playlist.add_song(song2)
    @playlist.add_song(song3)
    assert_equal([song1,song2,song3], @playlist.songs)
  end

  def test_adding_songs_as_a_group
    song1 = Song.new("I will survive")
    song2 = Song.new("My way")
    song3 = Song.new("It's raining men")
    @playlist.add_songs([song1, song2, song3])
    assert_equal([song1,song2,song3], @playlist.songs)
  end

end
