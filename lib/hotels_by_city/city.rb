require_relative 'config/environment.rb'

class HotelsByCity::City
    attr_accessor :name


    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
end