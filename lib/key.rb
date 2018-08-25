class Key
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def random_number
    rand(00000..99999).to_s
  end
end
