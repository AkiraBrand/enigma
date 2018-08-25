require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/enigma'
require './lib/key'


class KeyTest < Minitest::Test


  def test_it_exists
    key = Key.new("54321")
    assert_instance_of Key, key
  end

end
