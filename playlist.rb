class Playlist

    attr_reader :songs

    def initialize
      @songs = []
    end

    def add_song(song)
      return if song.class != Song
      @songs << song
    end

    def add_songs(song_array)
      @songs.concat(song_array)
    end
end
