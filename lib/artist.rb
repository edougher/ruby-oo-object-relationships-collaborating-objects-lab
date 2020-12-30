require 'pry'
class Artist
attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.find(name)
            self.find(name)
        else
            self.new(name)
        end

    end

    def print_songs
       
        puts Songs.all.select {|songs| songs.artist == self}
    end

end