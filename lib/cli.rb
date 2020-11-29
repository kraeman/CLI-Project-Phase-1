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
        if valid?
            print_hotels(search)
        else
            # recursive okay?
            run
        end
    end

    def valid?
    end

    def print_hotels(city)
    end

    def print_hotel_info(hotel)
    end
    

end