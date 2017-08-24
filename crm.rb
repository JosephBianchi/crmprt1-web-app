require_relative 'contact'
require 'sinatra'

get '/index' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end







after do
  ActiveRecord::Base.connection.close
end
