require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'pry'

def choose_city(city)
    array = city.split(" ")
    actual_city = array.join("%20")
    url = URI("https://hotels-com-free.p.rapidapi.com/suggest/v1.7/json?query="+actual_city+"&locale=en_US")
    http = Net::HTTP.new(url.host, url.port)
    # binding.pry
    http.use_ssl = true
    # binding.pry
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # binding.pry

    request = Net::HTTP::Get.new(url)
    # binding.pry
    request["x-rapidapi-key"] = '7460f033dfmsh3a061e65e47e0c6p1931cdjsnfa4fa275cedd'
    request["x-rapidapi-host"] = 'hotels-com-free.p.rapidapi.com'

    response = http.request(request)
    # puts response.read_body


    JSON.parse(response.read_body)["suggestions"].each do |thing|
        thing["entities"].each do |thingy|
            if thingy["type"] == "HOTEL"
                puts thingy["caption"]  
                puts "-"
                puts "latitude"
            end

        end
    end
end
choose_city("Seattlle")

