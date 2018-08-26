require 'date'

class Enigma

  attr_reader :character_map,
              :split_keys

  def initialize
   @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
   @split_keys = []
  end

  def encrypt (message, key = key_generator, date = Date.today)
    @split_keys << key.chars

  end

  def key_generator
    rand(00000..99999).to_s.rjust(5, '0')
  end

  def key_holder
    @split_keys.join[0..1]
  end

end
