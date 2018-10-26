require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < MiniTest::Test

  def test_make_song
    song = Song.new("Hey Jude")
    assert_equal(Song, song.class)
  end

  def test_song_name
    song = Song.new("Hey Jude")
    assert_equal("Hey Jude", song.title)
  end
end
