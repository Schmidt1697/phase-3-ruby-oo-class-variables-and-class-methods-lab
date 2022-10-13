require 'pry'

#can produce individual songs
#each song has name, artist, genre
#song class keeps track of all songs it creates

class Song

    #declare class var to keep track of number of songs created
    @@count = 0
    @@genres = []
    @@artists = []

    ##class methods
    #read/get class var (gain access to it)
    def Song.count
        @@count
    end
    #return only unique array of genres
    def Song.genres
        @@genres.uniq
    end
    #unique artists
    def Song.artists
        @@artists.uniq
    end
    #genre_count - returns a hash names of each genre => count of songs of that genre
    def Song.genre_count
        @@genres.tally
    end

    def Song.artist_count
        a_count = @@artists.uniq.map do |name|
            [name, @@artists.count(name)]
        end
        a_count.to_h
    end


    attr_accessor :name, :artist, :genre

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre

        #add self to the class var every instantiation of a new song 
        @@count += 1
        @@genres << self.genre
        @@artists << self.artist
        # @@genre_count << self.genre
        # @@artist_count << self.artist

    end

end

# s1 = Song.new("Song Name", "Tom", "rap" )
# ninety_nine_probs = Song.new("99 Problems", "Jay-Z", "rap")
# bad_habits = Song.new("Bad Habits", "Ed", "pop")
# another_song = Song.new("Another Song", "Ed", "country")

# binding.pry