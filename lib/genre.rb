class Genre
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def artists
        ret = []
        @songs.each do |song|
            if !ret.include?(song.artist)
                ret << song.artist
            end
        end
        ret
    end

    def add_song(song)
        @songs << song
    end
end
