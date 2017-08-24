module PokersHelper
  
  def moda(array, find_all=true)
    histogram = array.inject(Hash.new(0)) { |h, n| h[n] += 1; h }
    modes = nil
    histogram.each_pair do |item, times|
      modes << item if modes && times == modes[0] and find_all
      modes = [times, item] if (!modes && times>1) or (modes && times>modes[0])
    end
    return modes ? modes[1..modes.size] : modes
  end
  
  
  def reiniciar(sala)
    Poker.where(room: sala).destroy_all
  end
  
=begin  
  def numTotalCartas(sala)
    return Poker.where(room: sala).size.to_s
  end
  
  def teste
    return false
  end
  
  def sayHello
    return "HELLO"
  end
  
=end
end
