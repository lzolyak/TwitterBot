#applicationst that allows you to tweet remotely

require 'twitter'

#variable declarations
consumer_key = String.new
consumer_secret = String.new
access_token = String.new
access_secret = String.new

#reads access token file and stores the values
f = File.open("accessTokens.txt", "r")
consumer_key = f.readline
consumer_secret = f.readline
access_token = f.readline
access_secret = f.readline
f.close

#values for the twitter client
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = consumer_key.strip
  config.consumer_secret     = consumer_secret.strip
  config.access_token        = access_token.strip
  config.access_token_secret = access_secret.strip
end

#takes message to tweet
puts "Enter the message to Tweet: "
message = gets.chomp

#tweets it
client.update("#{message}")
