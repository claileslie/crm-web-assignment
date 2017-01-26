require 'minitest/autorun'
require_relative '../contact'

class TestContact < Minitest::Test

  def setup
    @contact = Contact.create(
    first_name: 'Grace',
    last_name: 'Hopper',
    email: 'grace@hopper.com',
    note: 'computer scientist')
  end

  def teardown
    Contact.delete_all
  end

  def test_all
    assert_equal [@contact], Contact.all
  end

  def test_find
    assert_equal @contact, Contact.find(@contact.id)
  end

  def test_find_by
    assert_equal @contact, Contact.find_by(first_name: 'Grace')
  end

  def test_delete_all
    Contact.delete_all
    assert_equal 0, Contact.all.size
  end

  def test_full_name
    assert_equal 'Grace Hopper', @contact.full_name
  end

  def test_update
    @contact.update(note: 'wrote the first compiler in 1952')
    assert_equal 'wrote the first compiler in 1952', @contact.note
  end

  def test_delete
    @contact.delete
    assert [], Contact.all
  end

end
