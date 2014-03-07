class Node
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def ==(other)
    if other && other.is_a?(Node)
      other.data == data
    else
      false
    end
  end
end
class IterativeLinkedList
  attr_accessor :list

  def initialize
    self.list = []
  end

  def count
    list.count
  end

  def push(element)
    list << Node.new(element)
  end

  def pop
    list.pop.data if list.any?
  end

  def delete(element)
    list.delete(Node.new(element))
  end

  def to_a
    list.map(&:data)
  end

  def last_node
    list[-1]
  end
end
