require_relative '../config/environment.rb'

class City
    attr_accessor :name


    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.create_from_api(info)
        self.new
    end
end