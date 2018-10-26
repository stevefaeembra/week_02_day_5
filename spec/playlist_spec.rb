require("minitest/autorun")
require("minitest/rg")
require_relative("../playlist")
require_relative("../song")

class TestPlaylist < MiniTest::Test

  def setup
    @playlist = Playlist.new()
  end

  def test_one
    assert_equal(1,0)
  end

end
