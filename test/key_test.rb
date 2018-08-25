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

  def test_it_generates_random_number
    key = Key.new("12344")
    assert_equal 5, key.random_number.length
  end

  def test_a_rotation
    key = Key.new("12344")
    assert_equal ["12"], key.encrypt[0] 

  end
end
