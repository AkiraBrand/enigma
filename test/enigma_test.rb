# require 'simplecov'
# SimpleCov.start
# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_starts_with_a_long_character_map
    expected = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
    assert_equal expected, @enigma.character_map
  end

  def test_the_random_key_generator_padding_works
    assert_equal 5, @enigma.key_generator.length
      binding.pry
  end

  def test_the_split_keys_hold_stuff
  
  end

  #
  # def test_the_key_placement_is_correct_with_given_key
  #   skip
  #   assert_equal Integer, @enigma.key_holder[0]
  # end

end
