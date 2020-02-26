
class Stack
    def initialize
        @underlying_array = []
    end

    def push(el)
        underlying_array.push(el)
        el
    end

    def pop
        underlying_array.pop
    end

    def peek
        underlying_array.last
    end

    private 

    attr_reader :underlying_array
end

p underlying_array = [1, 3, 12, 4, 8]
p stack = Stack.new
p stack.push(10)
p stack.pop
p stack.peek