
class PolyTreeNode
    attr_accessor :children

    def initialize(value = 0)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def parent=(new_parent)
        return @parent = nil if new_parent.nil?
        parent.remove_child(self) if parent
        @parent = nil
        new_parent.add_child(self) if new_parent
        @parent = new_parent
    end

    def value
        @value
    end

    def add_child(child)
        return nil if child.nil?
        unless @children.include?(child)
            @children << child
            child.parent = self
        end
    end

    def remove_child(child)
        raise "Not a child" unless @children.include?(child)

        @children.delete(child)
        child.parent = nil
    end

    def dfs(taret_value)
        return self if taret_value == value
        @children.each do |child|
            node = child.dfs(taret_value)
            return node if node
        end
        nil
    end

    def bfs(target_value)
        queue = [self]

        until queue.empty?
            node = queue.shift

            return node if node.value == target_value
            queue += node.children
        end
        nil
    end

    def inspect
        "#<#{value}"
    end
end








# module Searchable

#     def dfs(target = nil, &prc)
#         raise "Need a proc or target" if [target, prc].none?
#         prc ||= Proc.new { |node| node.value == target }

#         return self if prc.call(self)

#         children.each do |child|
#             result = child.dfs(&prc)
#             return result unless result.nil?
#         end
#         nil
#     end

#     def bfs(target = nil, &prc)
#        raise "Need a proc or target" if [target, prc].none? 
#        prc ||= Proc.new { |node| node.value == target }

#        nodes = [self]
#        until nodes.empty?
#         node = nodes.shift

#         return node if prc.call(node)
#         nodes.concat(node.children)
#        end
#        nil
#     end

#     def count
#         1 + children.map(&:count).inject(:+)
#     end
# end


# class PolyTreeNode
#     include Searchable

#     attr_accessor :value
#     attr_reader :parent

#     def initialize(value = nil)
#         @value = value
#         @parent = nil
#         @children = []
#     end

#     def children
#         @children.dup
#     end


#     def parent=(parent)
#         return if self.parent == parent

#         if self.parent
#             self.parent._children.delete(self)
#         end

#         @parent = parent
#         self.parent._children << self unless self.parent.nil?

#         self
#     end

#     def add_child(child)
#         child.parent = self
#     end

#     def remove_child(child)
#         if child && !self.children.include?(child)
#             raise "Tried to remove node that isn't a child"
#         end
#         child.parent = nil
#     end

#     protected

#     def children
#         @children
#     end
# end