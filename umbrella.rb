# Write your solution below!

require "dotenv/load"
require "http"
require "json"
require "dotenv/load"

# Hidden variables
google_key = ENV.fetch("Google_key")
pirate_key = ENV.fetch("Pirate_key")
pp "Where are you?"

their_location = gets.chomp

location_response = HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{their_location}&key=#{google_key}")

my_exact_location = JSON.parse(location_response)

currently_hash = my_exact_location.fetch("results")
new_hash = currently_hash.at(0)
newest_hash = new_hash.fetch("geometry").fetch("location")
latitude = newest_hash.fetch("lat")
longtitude = newest_hash.fetch("lng")

weather_reponse = HTTP.get("https://api.pirateweather.net/forecast/#{pirate_key}/#{latitude},#{longtitude}")
parsed_response = JSON.parse(weather_reponse)
currently_hash = parsed_response.fetch("currently")
current_temp = currently_hash.fetch("temperature")
puts "The current temperature is " + current_temp.to_s + "."
