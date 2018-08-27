require 'Date'

class Enigma

attr_reader :character_map,
            :date


  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.',',']
    @split_keys = []
  end

  def encrypt(message, key = key_generator, date = Date.today)
    @split_keys = key.chars
    @date = date
  end

  def key_generator
    rand(00000..99999).to_s.rjust(5, '0')
  end

  def key_holder
    @held_keys = []
    @held_keys << @split_keys.join[0..1]
    @held_keys << @split_keys.join[1..2]
    @held_keys << @split_keys.join[2..3]
    @held_keys << @split_keys.join[3..4]
  end

  def format_random_date

  end

end
