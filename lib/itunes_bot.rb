require 'rubygems'
require 'appscript'
require 'logger'

require './lib/utils'

class ItunesBot
  
  include Utils
  
  # Attributes -----------------------------------------------------------------
  
  attr_reader :app, :logger, :unknown_genres
  
  # Methods --------------------------------------------------------------------
  
  def initialize(playlist_name = 'Music')
    @app            = Appscript.app.by_name("iTunes.app")
    @playlist_name  = playlist_name
    @unknown_genres = []
    @logger         = Logger.new("./log/#{Time.now.to_i}.log")
  end
  
  def tidy
    app.playlists[@playlist_name].tracks.get.each do |track|      
      [:name, :artist, :album, :genre].each do |property|
        actual  = track.send(property).get
        cleaned = send("clean_#{property}", actual)
        if cleaned != actual
          track.send(property).set cleaned
          logger.info "[Cleaned #{property}] #{actual} => #{cleaned}"
        end
      end
    end
  end
    
  def clean_genre(value)
    genre = value.sanitize
    GENRES_MAPPING.each_pair do |master, regex|
      return master if genre =~ regex
    end
    @unknown_genres << genre unless @unknown_genres.include?(genre)
    return genre
  end
  
  def clean_name(value)
    clean_field(value)
  end
  
  def clean_artist(value)
    clean_field(value)
  end
  
  def clean_album(value)
    clean_field(value)
  end
  
  def clean_field(value)
    #Utils.clean(value)
    value.sanitize
  end
end