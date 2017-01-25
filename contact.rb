# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!

class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@next_id = 1

  def self.create(first_name, last_name, email, note) # use .create method when adding method, not .new
    # 1. initialize a new contact with a unique id
    new_contact = Contact.new(first_name, last_name, email, note)
    # 2. add the new contact to the list of all contacts
    @@contacts << new_contact
    # 3. return the newly created contact
    return new_contact
  end

  def self.all
    @@contacts
  end

  def self.find(identifier)
    @@contacts.map do |x|
      if x.id == identifier
        puts "#{x.contact_card}"
        return x
      end
    end
  end

#re: send in ruby docs -- send method invokes the method as specified as (attribute) in the method argument
  def self.find_by(attribute, value)
    @@contacts.each do |x|
    return x if x.send(attribute) == value
      end
  end

  def self.delete_all
    @@contacts = []
  end

  def initialize(first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @@next_id += 1
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def contact_card
    "ID: #{id}, Name: #{full_name}, Email: #{email}, Note: #{note}"
  end

#invoking the writer method - needs the =
  def update(attribute, new_value)
    self.send("#{attribute}=", new_value)
  end

  def delete
    @@contacts.delete(self)
  end

end
