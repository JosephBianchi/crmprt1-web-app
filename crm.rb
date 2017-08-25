require_relative 'contact'
require 'sinatra'

get '/index' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  @contact_count = Contact.count
  erb :contacts
end







after do
  ActiveRecord::Base.connection.close
end
