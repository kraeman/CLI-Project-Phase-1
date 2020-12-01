require_relative '../config/environment.rb'

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
        print "Enter the name of any city in the U.S.A. to see hotels there: ".colorize(:blue)
        city = gets.strip
        city_info = Getter.new.get_city_info(city)
     
        if valid_city?(city_info)
            city_object = City.create_from_api(city, city_info)
            Hotel.new_from_city(city_object)
            i = 1
            hotels_in_city = []
            Hotel.all.each do |hotel|
                if hotel.city == city_object
                    hotel_caption = hotel.caption.split(">")
                    puts "#{i.to_s}. " + hotel_caption.last.strip
                    # self.print_hotel_info(hotel)
                    i += 1
                    hotels_in_city << hotel
                end
            end
            loop do
                puts ""
                puts "Input the number of the hotel you want the latitude and longitude for!"
                number = gets.strip.to_i
                if number <= hotels_in_city.length && number >= 1 
                    print_hotel_info(hotels_in_city[number - 1])
                    break
                else
                    puts "Not a valid response!"
                    sleep 1
                end
            end
            self.choice
        else
            puts "Maybe you should check a map..."
            sleep 1
           self.choice
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
        puts "-------------------------------"
        hotel_caption = hotel.caption.split(">")
        puts hotel_caption.last.strip
        puts "Latitude: " + hotel.latitude.to_s
        puts "Longitude: " + hotel.longitude.to_s
        puts "-------------------------------"
    end

    def choice
        loop do
            puts "try again (y/n)"
            continue_response = gets.strip
            if continue_response == "y" || continue_response == "Y"
                self.run
            elsif continue_response == "n" || continue_response == "N"
                puts "Peace out!"
                sleep 1
                exit
            else
                puts "Not a valid response!"
                sleep 1
            end
        end
    end
    

end