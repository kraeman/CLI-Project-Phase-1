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

    def self.new_from_api(a)
        a.each do |group|
            group['entities'].each do |entity|
                if entity["type"] == "HOTEL"
                    self.new(entity["caption"], entity["latitude"], entity["longitude"])
                end
            end
        end
        
    end

    def self.all
        @@all
    end
end