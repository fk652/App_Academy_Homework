class Stack
  def initialize
    @stack = []
  end

  def push(el)
    # @stack.push(el)
    stack << el
    self
  end

  def pop
    stack.pop
  end

  def peek
    stack[-1]
  end

  private
  attr_reader :stack
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    # queue.push(el)
    queue << el
    self
  end

  def dequeue
    queue.shift
  end

  def peek
    queue[0]
  end

  private
  attr_reader :queue
end

class Map 
  def initialize
    @map = []
  end

  def set(key, value)
    idx = map.index { |kv_pair| kv_pair[0] == key }
    if idx != nil
      map[idx][1] = value
    else
      map.push([key, value])
    end
  end

  def get(key)
    idx = map.index { |kv_pair| kv_pair[0] == key }
    idx == nil ? nil : map[idx][1]
  end

  def delete(key)
    idx = map.index { |kv_pair| kv_pair[0] == key }
    map.delete_at(idx) if idx != nil
  end

  def show 
    map
  end

  private
  attr_reader :map
end

puts "testing Stack"
stack = Stack.new
puts "peek #{stack.peek}"
puts "push 1"
stack.push(1)
puts "peek => #{stack.peek}"
puts "push 2"
stack.push(2)
puts "peek => #{stack.peek}"
puts "push 3"
stack.push(3)
puts "peek => #{stack.peek}"
puts "pop => #{stack.pop}"
puts "peek => #{stack.peek}"
puts "pop => #{stack.pop}"
puts "peek => #{stack.peek}"
puts

puts "testing Queue"
queue = Queue.new
puts "peek => #{queue.peek}"
puts "enqueue 1"
queue.enqueue(1)
puts "peek => #{queue.peek}"
puts "enqueue 2"
queue.enqueue(2)
puts "peek => #{queue.peek}"
puts "enqueue 3"
queue.enqueue(3)
puts "peek => #{queue.peek}"
puts "dequeue => #{queue.dequeue}"
puts "peek #{queue.peek}"
puts "dequeue => #{queue.dequeue}"
puts "peek => #{queue.peek}"
puts

puts "testing Map"
map = Map.new
puts "show #{map.show}"
puts "set a => 1"
map.set(:a, 1)
puts "show #{map.show}"
puts "set b => 2"
map.set(:b, 2)
puts "show #{map.show}"
puts "set c => 3"
map.set(:c, 3)
puts "show #{map.show}"
puts "get a => #{map.get(:a)}"
puts "get b => #{map.get(:b)}"
puts "get c => #{map.get(:c)}"
puts "get d => #{map.get(:d)}"
puts "set a => 4"
map.set(:a, 4)
puts "get a => #{map.get(:a)}"
puts "show #{map.show}"
puts "delete b"
map.delete(:b)
puts "get b => #{map.get(:b)}"
puts "show #{map.show}"