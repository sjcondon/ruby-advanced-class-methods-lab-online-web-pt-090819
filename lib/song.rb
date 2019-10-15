class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.create #instantiate a  new song
    song.save
    song
  end

    def self.new_by_name(song_name)
    song= self.create
    song.name =  song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self_find_or_create_by_name(song_name)
#check to see if there is a song name called “Allison”and if there isn’t, we need to create one
    self.find_by _name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_file(song)
    split_file = song..split(“ - “) #sake of the file format
    artist = split_file[0]
    song_name =  split_file[1].split(“.”)[0]
  #song_name =  split_file[1].gsub(“.mp3,””)

song = self.new_by_name(song_name)
song.artist_name = artist
song
end

#song = song.new
#song.name = song_name
#song.artist_name= artist
#song

  def self.create_from_filename(song)
#if new_from_filename save the song instance
    self.new_from_filename(song)
  end

  def self.destroy_all
    self.all.clear
  end
end
