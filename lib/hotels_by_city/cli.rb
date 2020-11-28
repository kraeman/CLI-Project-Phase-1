require 'pry'
require 'colorize'

class CLI

    def begin
        
    end

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