require 'date'

class Enigma
  attr_reader :key

  def initialize(message, key = "54321", date = Date.today)
    @message = message
    @key = key
    @date = date
  end

end
