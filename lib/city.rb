require_relative '../config/environment.rb'

class City
    attr_accessor :name


    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
end