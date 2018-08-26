class Key
  attr_reader :key

  def initialize(key)
    if @key == nil
     @key = random_number
    else
     @key == key
    end
  end

  def random_number
    rand(00000..99999).to_s
  end
end
