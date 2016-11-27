require 'mongo'
require 'json'  

class WelcomeController < ApplicationController
  def index
  end

  def fetch
		connection = Mongo::Client.new(['ds145997.mlab.com:45997/heroku_39vlh4vn'], :database => 'heroku_39vlh4vn', :user => 'srs5800', :password => 'srs5800')

		data = connection.database
		data1 = data.collection('Database')
		@db = data1.find({:id => params[:x]});

		render json: @db
  end
end

