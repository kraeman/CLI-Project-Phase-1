require '../config/environment.rb'

class CLI

    def start
        print "Loading".colorize(:green)
        3.times do
            sleep 1
            print ".".colorize(:red)
        end
        run
    end

    def run
        puts ""
        print "Enter the name of any city in the U.S.A.: ".colorize(:blue)
        city = gets.strip
        city_info = Getter.new.get_city_info(city)
        if valid_city?(city_info)
            city_object = City.create_from_api(city, city_info)
            Hotel.new_from_city(city_object)
            i = 1
            Hotel.all.each do |hotel|
                thing = hotel.caption.split(">")
                puts "#{i.to_s}. " + thing.last.strip
                self.print_hotel_info(hotel)
                i += 1
            end
            puts "Choose a hotel with the arrow keys and slam that ENTER button for the hotels coordinates!"
        else
            exit
        end
    end

    def valid_city?(city_info)
       if city_info[0]["entities"] != []
             true
        end
    end
    


    def make_hotels_from_city(city)
        Hotel.new_from_api(city)
    end

    def print_hotel_info(hotel)
        puts hotel.latitude
        puts hotel.longitude
    end
    

end