require '../config/environment.rb'

class CLI

    def start
        print "Loading".colorize(:green)
        3.times do
            # sleep 1
            print ".".colorize(:red)
        end
        run
    end

    def run
        puts ""
        puts "Enter the name of any city in the U.S.A.".colorize(:blue)
        city = gets.strip
        search = Getter.new.get_city(city)
        if valid_city?(search)
            Hotel.new_from_api(search)
            i = 1
            Hotel.all.each do |hotel|
                thing = hotel.caption.split(">")
                puts "#{i.to_s}. " + thing.last.strip
                self.print_hotel_info(hotel)
                i += 1
            end
            puts "Choose a hotel with the arrow keys and slam that ENTER button for the hotels coordinates!"
            
        else
            # recursive okay?
            puts "Maybe go back to geography class..."
            sleep 1
            exit
            run
          
        end
    end

    def valid_city?(city)
       if city[0]["entities"] != []
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
CLI.new.start