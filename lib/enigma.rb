require 'Date'

class Enigma

attr_reader :character_map,
            :date,
            :message


  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.',',']
    @split_keys = []
  end

  def encrypt(message, key = key_generator, date = Date.today)
    @split_keys = key.chars
    @date = date
    @message = message.chars
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
    {
      "a" => (offset[0] + key_array[0]),
      "b" => (offset[1] + key_array[1]),
      "c" => (offset[2] + key_array[2]),
      "d" => (offset[3] + key_array[3])
    }
  end

  def slice_it
    encrypted_message = []
    @message.each_slice(4) do |rotation_group|
      rotation_group_hash = create_hash(rotation_group)


      rotation_group_hash.each do |key, value|
        number_of_rotations = where_to_rotate[key]
        starting_index = @character_map.index(value)
        rotated_value = @character_map.rotate(number_of_rotations + starting_index)

        encrypted_message << rotated_value[0]
      end
    end
    p encrypted_message
  end

  def create_hash(rotation_group)
    if rotation_group.count == 4
       {
        "a" => rotation_group[0],
        "b" => rotation_group[1],
        "c" => rotation_group[2],
        "d" => rotation_group[3],
      }
    elsif rotation_group.count == 3
       {
        "a" => rotation_group[0],
        "b" => rotation_group[1],
        "c" => rotation_group[2],
      }
    elsif rotation_group.count == 2
       {
        "a" => rotation_group[0],
        "b" => rotation_group[1]
      }
    else
      rotation_group.count == 1
         {
          "a" => rotation_group[0]
        }
    end
  end
 # join method and write it to new file 
  # def encrypt(letter)
  #   letter.map_with_index do |x, i|
  #     if i = 0
  #       # where_to_rotate["a"] - the number of rotations
  #       # what index is "h" on the character map
  #       # the index of the new value after the rotations
  #   end
  # end

 # have an array with 4 characters, splitting them and matching them up with the "where_to_rotate" method.
 # rotation_group.each_with_index do |letter, i|

#   if i = 0 do
#     number_of_rotations = where_to_rotate["a"]
#     index = @character_map.each_with_index {|l, i| if letter == l, index = i}
#   end
# end
# if rotation_group[0] do
#   number_of_rotations =
# end
 # rotation_group[0] - where_to_rotate["a"] rotations
 # where in the character map is rotation_group[0]
 # rotation_group[1] - where_to_rotate["b"] rotations
 # rotation_group[2] - where_to_rotate["c"] rotations
 # rotation_group[3] - where_to_rotate["d"] rotations
# encrpyted_message << rotate_letters(letter)



end
