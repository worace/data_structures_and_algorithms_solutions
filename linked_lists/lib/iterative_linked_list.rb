class Node
  attr_reader :data
  attr_accessor :next_node
  def initialize(data, next_node = nil)
    @data = data
    self.next_node = next_node
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
    list << Node.new(element, list.last)
  end

  def pop
    list.pop.data if list.any?
  end

  def delete(element)
    list.delete(Node.new(element, list.last))
  end

  def to_a
    list.map(&:data)
  end

  def last_node
    list[-1]
  end

  def include?(element)
    list.map(&:data).include?(element)
  end

  def insert(index, element)
    new_node = Node.new(element, list[index-1])
    list[index].next_node = new_node
    list.insert(index, new_node)
  end

  def find(element)
    list[list.map(&:data).index(element)]
  end

  def index(element)
    list.map(&:data).index(element)
  end

  def insert_after(element, new_element)
    insert(index(element)+1, new_element)
  end
end
