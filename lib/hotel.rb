require_relative '../config/environment.rb'

class Hotel
    attr_reader :caption, :latitude, :longitude, :city

    @@all = []

    def initialize(caption, latitude, longitude)
        @caption = caption
        @latitude = latitude
        @longitude = longitude
        @@all << self
    end

    def self.all
        @@all
    end
end