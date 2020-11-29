require_relative '../config/environment.rb'

class City
    attr_accessor :name, :hotel


    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
end