# since this implementation doesn't use a linked list
# it will ignore keeping track of what's recently used
class LRUCache 
  attr_reader :count

  def initialize(size = 4)
    @size = size
    @cache = Array.new(size) { [] }
    @count = 0
  end

  def add(el)
    index = el.hash % size
    cache[index].push(el) unless cache[index].include?(el)
    @count += 1
    rehash if count == size
  end

  def show
    p cache.flatten(1)
  end

  private
  attr_reader :size
  attr_accessor :cache

  def rehash
    old_cache = cache
    @size *= 2
    @cache = Array.new(size) { [] }
    old_cache.each { |bucket| bucket.each { |el| add(el) } }
  end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]