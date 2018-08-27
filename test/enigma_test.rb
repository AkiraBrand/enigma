require 'simplecov'
SimpleCov.start
require './test/test_helper'
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

  def test_it_starts_with_a_character_map
    expected = [*('a'..'z'), *('0'..'9'), ' ', '.',',']
    #without the splat, it won't actually expand upon what you want
    #it just returns this: ["a".."z", "0".."9", " ", ".", ","]
    #like....thanks bro
    assert_equal expected, @enigma.character_map
  end

  def test_the_random_key_generator_generates_a_five_character_key
    assert_equal 5, @enigma.key_generator.length
    #I tested this a few times without rjust, and it spat out a 5 character
    #string each time. i will put the rjust back in, just to be safe
    #but i'm wondering if its absolutely necessary
  end

  def test_the_master_key_holder_with_given_key
    @enigma.encrypt("hello", "12345")
    assert_equal ["12", "23", "34", "45"], @enigma.key_holder
  end

  def test_random_date_generator_returns_only_the_year
    @enigma.encrypt("hello")
     binding.pry
    assert_equal 18, @enigma.format_random_date

  end

end


# The date of message transmission is also factored into the encryption
# Consider the date in the format DDMMYY, like 240818
# Square the numeric form (412699225) and find the last four digits (9225)
# The first digit is the “A offset” (9)
# The second digit is the “B offset” (2)
# The third digit is the “C offset” (2)
# The fourth digit is the “D offset” (5)
