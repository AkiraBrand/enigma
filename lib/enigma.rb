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
    held_keys = []
    held_keys << @split_keys.join[0..1]
    held_keys << @split_keys.join[1..2]
    held_keys << @split_keys.join[2..3]
    held_keys << @split_keys.join[3..4]
  end

  def last_four
    string_date = @date.strftime("%d%m%y")
    integer_date = string_date.to_i
    squared_date = integer_date ** 2
    squared_date.to_s[-4..-1]
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

  def where_to_rotate
    final_rotation = []
    final_rotation << (offset[0] + key_array[0])
    final_rotation << (offset[1] + key_array[1])
    final_rotation << (offset[2] + key_array[2])
    final_rotation << (offset[3] + key_array[3])
  end

  final_rotation[0] % 39 = index of "a" position
  final_rotation[1] % 39 = index of "b" position
  final_rotation[2] % 39 = index of "c" position
  final_rotation[3] % 39 = index of "d" position





 #  @dictionary = ["a",
 #    "b",
 #    "c",
 #    "d",
 #    "e",
 #    "f",
 #    "g",
 #    "h",
 #    "i",
 #    "j",
 #    "k",
 #    "l",
 #    "m",
 #    "n",
 #    "o",
 #    "p",
 #    "q",
 #    "r",
 #    "s",
 #    "t",
 #    "u",
 #    "v",
 #    "w",
 #    "x",
 #    "y",
 #    "z",
 #    "0",
 #    "1",
 #    "2",
 #    "3",
 #    "4",
 #    "5",
 #    "6",
 #    "7",
 #    "8",
 #    "9",
 #    " ",
 #    ".",
 #    ","]
 #
 #
 #
 #  my_message = "You got this"
 #
 #  my_message.scan(/.{4}/)
 #
 #  my_message.chars
 #
 #  indexed = []
 #  @character_map.each_with_index do |element, index|
 #    indexed << index
 #  end
 #
 #  indexed = 0,
 #  1,
 #  2,
 #  3,
 #  4,
 #  5,
 #  6,
 #  7,
 #  8,
 #  9,
 #  10,
 #  11,
 #  12,
 #  13,
 #  14,
 #  15,
 #  16,
 #  17,
 #  18,
 #  19,
 #  20,
 #  21,
 #  22,
 #  23,
 #  24,
 #  25,
 #  26,
 #  27,
 #  28,
 #  29,
 #  30,
 #  31,
 #  32,
 #  33,
 #  34,
 #  35,
 #  36,
 #  37,
 #  38
 #
 # @character_map.zip(indexed)
 # [["a", 0],
 # ["b", 1],
 # ["c", 2],
 # ["d", 3],
 # ["e", 4],
 # ["f", 5],
 # ["g", 6],
 # ["h", 7],
 # ["i", 8],
 # ["j", 9],
 # ["k", 10],
 # ["l", 11],
 # ["m", 12],
 # ["n", 13],
 # ["o", 14],
 # ["p", 15],
 # ["q", 16],
 # ["r", 17],
 # ["s", 18],
 # ["t", 19],
 # ["u", 20],
 # ["v", 21],
 # ["w", 22],
 # ["x", 23],
 # ["y", 24],
 # ["z", 25],
 # ["0", 26],
 # ["1", 27],
 # ["2", 28],
 # ["3", 29],
 # ["4", 30],
 # ["5", 31],
 # ["6", 32],
 # ["7", 33],
 # ["8", 34],
 # ["9", 35],
 # [" ", 36],
 # [".", 37],
 # [",", 38]]
 #
 #
 # (rotation + offset) % 39 = the index of letter "A"
 # (rotation + offset) % 39 = the index of letter "B"
 # (rotation + offset) % 39 = the index of letter "C"
 # (rotation + offset) % 39 = the index of letter "A"
 #

end
