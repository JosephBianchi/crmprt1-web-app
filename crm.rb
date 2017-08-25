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

get '/contacts/:id' do
  #params[:id] contains the id from the URL
  @contact = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
end

get '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end







after do
  ActiveRecord::Base.connection.close
end
