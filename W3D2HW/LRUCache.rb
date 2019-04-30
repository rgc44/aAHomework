  class LRUCache

    attr_accessor :cache
    attr_reader :SIZE

    def initialize(size)
        @SIZE = size
        @count = 0
        @cache = []
    end

    def count
      self.cache.count
    end

    def add(el)
    # adds element to cache according to LRU principle
        if !self.cache.include?(el)
            self.cache << el if self.count < self.SIZE
            if self.count == self.SIZE
                self.cache.shift
                cache << el
            end
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p self.cache
    end

    private
    # helper methods go here!

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

p johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show