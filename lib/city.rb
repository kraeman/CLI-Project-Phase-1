require_relative '../config/environment.rb'

class City
    attr_accessor :name, :city_info

    @@all = []

    def initialize(name, city_info)
        @name = name
        @city_info = city_info
        @@all << self
    end

    def self.create_from_api(name, city_info)
        self.new(name, city_info)
    end
end