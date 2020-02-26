
class Queue
    def initialize
        @underlying_array = []
    end

    def enqueue(el)
        underlying_array.push(el)
        el
    end

    def dequeue
        underlying_array.shift
    end

    def peek
        underlying_array.first
    end

    private 

    attr_reader :underlying_array
end

p underlying_array = [1, 3, 12, 4, 8]
p queue = Queue.new
p queue.enqueue(5)
p queue.dequeue
p queue.peek

