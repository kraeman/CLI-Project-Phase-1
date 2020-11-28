require 'pry'

class CLI

    def begin
        
    end

    def run
        print "Loading"
        3.times do
            sleep 1
            print "."
        end
        sleep 1
        puts ""
        puts "hello"
    end
    

end

CLI.new.run