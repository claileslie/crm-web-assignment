# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative "contact"
require "sinatra"

Contact.create("Prudence","Leslie","prudence@live.ca","mama kitty")
Contact.create("Oliver","Leslie","oliver@live.ca","daddy kitty")
Contact.create("Max", "Leslie", "max@live.ca", "baby kitty")




get "/" do
  @crm_app_name = "Claire's CRM"
  erb :index
end

get "/contacts" do
  @contact_name = "Contacts"
  erb :contacts
end
