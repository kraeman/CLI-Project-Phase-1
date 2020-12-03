class HotelsByCity::CLI
    include HotelsByCity::Getter
    def start
        print "Loading".colorize(:green)
        3.times do
            sleep 1
            print ".".colorize(:red)
        end
        sleep 1
        run
    end

    def run
        puts ""
        puts ""
        print "Enter the name of any city in the U.S.A. to see hotels there: ".colorize(:blue)
        city = gets.strip
        city_info = get_city_info(city)
     
        if valid_city?(city_info)
            hotels_in_city = []
            make_city_and_hotels(city, city_info, hotels_in_city)
            loop do
                puts ""
                puts "Input the number of the hotel you want the latitude and longitude for!"
                number = gets.strip.to_f
                if number.to_i == number
                    if number <= hotels_in_city.length && number >= 1 
                        print_hotel_info(hotels_in_city[number - 1])
                        break
                    else
                        puts "Not a valid response!"
                        sleep 1
                    end
                else
                    puts "Maybe go buy a calculator..."
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
    
    def make_city_and_hotels(city, city_info, hotels_in_city)
        city_object = HotelsByCity::City.new(city, city_info)
        HotelsByCity::Hotel.new_from_city(city_object)
            i = 1
            HotelsByCity::Hotel.all.each do |hotel|
                if hotel.city == city_object
                    hotel_caption = hotel.caption.split(">")
                    puts "#{i.to_s}. " + hotel_caption.last.strip
                    i += 1
                    hotels_in_city << hotel
                end
            end
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