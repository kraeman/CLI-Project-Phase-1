require_relative '../config/environment.rb'

class Hotel
    attr_reader :caption, :latitude, :longitude, :city

    @@all = []

    def initialize(caption, latitude, longitude, city)
        @caption = caption
        @latitude = latitude
        @longitude = longitude
        @city = city
        @@all << self
    end

    def self.new_from_city(c)
        c.city_info.each do |group|
            group['entities'].each do |entity|
                if entity["type"] == "HOTEL"
                    self.new(entity["caption"], entity["latitude"], entity["longitude"], c)
                end
            end
        end
        
    end

    def self.all
        @@all
    end
end