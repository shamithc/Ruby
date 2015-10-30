class House

  attr_reader :data, :formatter

  DATA = ["This is the farmer sowing his corn",
          "That kept the cock that crowed in the morn",
          "That waked the priest all shaven and shorn",
          "That married the man all tattered and torn",
          "That kissed the maiden all forlorn",
          "That milked the cow with the crumpled horn",
          "That tossed the dog",
          "That worried the cat",
          "That killed the rat",
          "That ate the malt",
          "That lay in the house that Jack built"]

  def initialize(orderer: DefaultOrder.new, formatter: DefaultFormatter.new)
    @formatter = formatter
    @data = orderer.order(DATA)
  end

  def recite
    (1..data.length).map {|i| phrase(i)}.join("\n")
  end

  def line number
    "This is #{phrase(number)}\n"
  end

  def parts number
    formatter.format(data.last(number))
  end

  def phrase number
    parts(number).join(' ')
  end
end


class DefaultOrder
  def order(data)
    data
  end
end

class RandomOrder
  def order(data)
    data. shuffle
  end
end

class DefaultFormatter
  def format(parts)
    parts
  end
end


class EchoFormatter
  def format(parts)
    parts.zip(parts).flatten
  end
end


house = House.new(orderer: RandomOrder.new, formatter: EchoFormatter.new)

puts house.recite
