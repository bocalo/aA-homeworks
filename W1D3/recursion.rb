# def fibs(n)
#     return[0, 1].take(n) if n <= 2

#     prev_fibs = fibs(n - 1)
#     last_num = (prev_fibs[-1] + prev_fibs[-2])
#     prev_fibs << last_num
# end

# class Array
#     def quicksort
#         return self.dup if self.length <= 1

#         pivot = self.first
#         left = self.drop(1).select { |el| el < pivot }
#         right = self.drop(1).select { |el| el >= pivot }

#         sorted_left = left.quicksort
#         sorted_right = right.quicksort

#         sorted_left + [pivot] + sorted_right
#     end
# end

# def sum_to(n)
#     return nil if n < 0
#     return 1 if n == 1

#     n + sum_to(n - 1)
# end
# p sum_to(-8)

# def add_numbers(nums)
#    return nums.first if nums.length <= 1
#    nums.pop + add_numbers(nums)
# end

# p add_numbers([])

# def gamma_fnc(n)
#     return nil if n < 1
#     return 1 if n == 1
    
#     (n - 1) * gamma_fnc(n - 1)
# end

# p gamma_fnc(1)

# def ice_cream_shop(flavors, favorite)
#     return false if flavors.empty?
#     return true if flavors.last == favorite

#     ice_cream_shop(flavors[0...-1], favorite)
# end

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p  ice_cream_shop([], 'honey lavender')  # => returns false


# def reverse(string)
#     return "" if string.empty?
#     reverse(string[1..-1]) + string[0]
# end

# p  reverse("house") # => "esuoh"
# p  reverse("dog") # => "god"
# p  reverse("atom") # => "mota"
# p  reverse("q") # => "q"
# p  reverse("id") # => "di"
# p reverse("") # => ""


# def range(min, max)
#     return [] if max <= min 
#     range(min, max - 1) << max - 1
# end

# p range(2, 7)

# def exp1(base, power)
#     power == 0 ? 1 : base * exp1(base, power - 1)
# end

# def exp2(base, power)
#     return 1 if power == 0

#     half = exp2(base, power / 2)
#     if power.even?
#         half * half
#     else
#         base * half * half
#     end
# end

# class Array
#     def deep_dup
#         new_arr = []
#         self.each do |el|
#             new_arr << (el.is_a?(Array) ? el.deep_dup : el)
#         end
#         new_arr
#     end

#     def dd_map
#         map { |el| el.is_a?(Array) ? el.dd.map : el }
#     end
# end

# def fib(n)
#     return 1 if n == 0
#     return 1 if n == 1

#     fib(n - 1) + fib(n - 2)
# end

# def fib(n)
#      return [] if n == 0
#      return [0] if n == 1 

#     fibs = [0, 1]
#     while fibs.count < n
#         fibs << fibs[-2] + fibs[-1]
#     end
#     fibs
# end

# def fib(n)
#     if n <= 2
#         [0, 1].take(n)
#     else
#         fibs = fib(n - 1)
#         fibs << fibs[-2] + fibs[-1]
#     end
# end

# p fib(5)

# def bsearch(nums, target)
#     return nil if nums.empty?

#     probe_index = nums.length / 2
#     case target <=> nums[probe_index]
#     when -1
#         bsearch(nums.take(probe_index), target)
#     when 0
#         probe_index
#     when 1
#         sub_answer = bsearch(nums.drop(probe_index + 1), target)
#         sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
#     end
# end

# p bsearch([1, 2, 3], 1) # => 0
# p    bsearch([2, 3, 4, 5], 3) # => 1
# p    bsearch([2, 4, 6, 8, 10], 6) # => 2
# p    bsearch([1, 3, 4, 5, 9], 5) # => 3
# p    bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p    bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p   bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# class Array
#     def merge_sort
#         return self if count < 2

#         middle = count / 2

#         left, right = self.take(middle), self.drop(middle)
#         sorted_left, sorted_right = left.merge_sort, right.merge_sort

#         merge(sorted_left, sorted_right)
#     end

#     def merge(left, right)
#         merged_array = []
#         until left.empty? || right.empty?
#             merged_array << (left.first < right.first) ? left.shift : right.shift
#         end
#         merged_array + left + right
#     end
# end

# p [2, 22, 34, 5, 6, 87, 11].merge_sort

# class Array
#     def subsets
#        return [[]] if empty?
#        subs = take(count - 1).subsets
#        subs.compact(subs.map{ |sub| sub + [last] })
#     end
# end

# def permutations(array)
#     return [array] if array.length <= 1

#     first = array.shift

#     perms = permutations(array)
#     total_permutations = []

#     perms.each do |perm|
#         (0..perm.length).each do |i|
#             total_permutations << perm[0...i] + [first] + perm[i..-1]
#         end
#     end
#     total_permutations
# end

# p permutations([1, 2, 3])

# def make_change(target, coins = [25, 10, 5, 1])
#     return [] if target == 0
#     return nil if coins.none? { |coin| coin <= target }

#     coins = coins.sort.reverse

#     best_change = nil
#     coins.each_with_index do |coin, index|
#         next if coin > target
#         remander = target - coin

#         best_remainder = make_change(remander, coins.drop(index))
#         next if best_remainder.nil?

#         this_change = [coin] + best_remainder

#         if best_change.nil? || (this_change.count < best_change.count)
#             best_change = this_change
#         end
#     end
#     best_change
# end

p make_change(44, [25, 10, 5, 1])