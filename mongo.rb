require 'json'
require 'open-uri'
require "mongo"
include Mongo

data = JSON.parse(open("https://data.cityofnewyork.us/api/views/jb7j-dtam/rows.json?accessType=DOWNLOAD").read)

connection = Mongo::Client.new(['ds145997.mlab.com:45997/heroku_39vlh4vn'], :database => 'heroku_39vlh4vn', :user => 'srs5800', :password => 'srs5800')

i = 1

while i < 101 
	a = connection[:Data].insert_one({
		id: "#{i}",
		ethnicity: data["data"][i][9],
		sex: data["data"][i][10],
		causeOfDeath: data["data"][i][11],
		year: data["data"][i][8]
	})
	i+=1
end

puts "Data stored."