module Getter

    def get_city_info(city)
        array = city.split(" ")
        actual_city = array.join("%20")
        url = URI("https://hotels-com-free.p.rapidapi.com/suggest/v1.7/json?query="+actual_city+"&locale=en_US")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        #Leaving API key exposed for educational purposes. dotenv not compatible with BIgSur on 12/03/20
        request["x-rapidapi-key"] = '7460f033dfmsh3a061e65e47e0c6p1931cdjsnfa4fa275cedd'
        request["x-rapidapi-host"] = 'hotels-com-free.p.rapidapi.com'
        response = http.request(request)
    

        JSON.parse(response.read_body)["suggestions"]
    end
end