require 'pry'

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def genres
        ret = []
        songs.each do |song|
            if !ret.include?(song.genre)
                ret << song.genre
            end
        end
        ret
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end
end
