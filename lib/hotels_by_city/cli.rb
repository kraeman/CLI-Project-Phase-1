require '/cli-project-phase-1/config/environment.rb'

class HotelsByCity::CLI


    def run
        print "Loading".colorize(:green)
        3.times do
            sleep 1
            print ".".colorize(:red)
        end
        sleep 1
        puts ""
        puts "hello"
    end
    

end

CLI.new.run