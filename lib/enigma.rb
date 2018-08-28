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

  def last_four
    string_date = @date.strftime("%d%m%y")
    integer_date = string_date.to_i
    squared_date = integer_date ** 2
    squared_date.to_s[-4..-1]
  end

  def offset
    offset = last_four.chars
    offset.map do |number|
      number.to_i
    end
  end

  def key_array
    key_array = key_holder.map do |key|
      key.to_i
    end
  end

  def rotate
    @final_rotation = []
    @final_rotation << (offset[0] + key_array[0])
    @final_rotation << (offset[1] + key_array[1])
    @final_rotation << (offset[2] + key_array[2])
    @final_rotation << (offset[3] + key_array[3])
  end
end

#  charred = last_four.chars  = "9124"
#  key_holder = ["12", "23", "34", "45"]
#
#  offset_integer = charred.map do |num|
#    num.to_i
#  end
# offset_integer = [9, 1, 2, 4]
#
#
# key_integer = key_holder.map do |num|
#   num.to_i
# end
# key_integer = [12, 23, 34, 45]
#
# a_rotation = key_integer[0] + offset_integer[0]
# a_rotation = 21
