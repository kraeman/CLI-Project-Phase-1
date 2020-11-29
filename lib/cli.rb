require '../config/environment.rb'

class CLI

    def start
        Getter.new.choose_city(city)
        print "Loading".colorize(:green)
        3.times do
            sleep 1
            print ".".colorize(:red)
        end
        run
    end

    def run
        puts "Enter any city in the U.S.A."
        city = gets.strip
        search = Getter.new.choose_city(city)
        if valid_city?
            hotels(search)
            puts "Choose a hotel with the arrow keys and slam that ENTER button for some sweet details!"
            print_hotel_info

        else
            # recursive okay?
            puts "Maybe go back to geography class..."
            sleep 1
            run
        end
    end

    def valid_city?
    end


    def hotels(city)
    end

    def print_hotel_info(hotel)
    end
    

end