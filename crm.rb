# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

Contact.create("Prudence","Leslie","prudence@live.ca","mama kitty")
# Contact.create("Oliver","Leslie","oliver@live.ca","daddy kitty")
# Contact.create("Max", "Leslie", "max@live.ca", "baby kitty")




get '/' do
  @crm_app_name = "Claire's CRM"
  erb :index
end

get '/contacts' do
  @contact_name = 'Contacts'
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/')
end

get '/contacts/1' do
  @contact = Contact.find(1)
  erb :show_contact
end
