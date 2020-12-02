

class City
    attr_accessor :name, :city_info

    @@all = []

    def initialize(name, city_info)
        @name = name
        @city_info = city_info
        @@all << self
    end

end