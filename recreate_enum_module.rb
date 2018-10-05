module Enumerable
  #return to_enum(:my_each)
 
   # my version of each;
   def my_each
     i = 0
     while i < self.to_a.length
       yield self.to_a[i]
       i += 1
     end
   end
 
   # my version of .each_with_index method
   def my_each_with_index
     i = 0
     while i < self.to_a.length
       yield self.to_a[i], i
       i += 1
     end
   end
 
   # my version of .select method
   def my_select
     result = []
     i = 0
     while i < self.to_a.length
       if yield self.to_a[i] 
         result << self.to_a[i]
       end
       i += 1
     end
     result
   end
 
   # my version of .all method
   def my_all? (pattern = false)
     if block_given?
       self.my_each{|item| return false if !!(yield item) == false}
     elsif !!pattern == true
       self.my_each{|item| return false if (pattern === item) == false}
     else
       self.my_each{|item| return false if !!item == false}
     end
     true
   end
 
   # my version of .any method
   def my_any? (pattern = false)
     if block_given?
       self.my_each{|item| return true if yield item}
     elsif !!pattern == true
       self.my_each{|item| return true if pattern === item}
     else
       self.my_each{|item| return true if !!item}
     end
     false
   end
 
   # my version of .none method
   def my_none? (pattern = false)
     if block_given?
       self.my_each{|item| return false if yield item}
     elsif !!pattern == true
       self.my_each{|item| return false if pattern === item}
     else
       self.my_each{|item| return false if !!item}
     end
     true
   end
 
   # my version of .count method
   def my_count? (pattern = false)
     count = 0
     if block_given?
       self.my_each{|item| count += 1 if yield item}
     elsif !!pattern == true
       self.my_each{|item| count += 1 if pattern === item}
     else
       self.my_each{|item| count += 1 if !!item}
     end
     count
   end
 
   # my version of .map;
   def my_map(proc=nil)
     result = []
     self.to_a.my_each do |item|
       if proc
         result.push(proc.call item)
       elsif block_given?
         result.push(yield item)
       end
     end
     result
   end
 
   # my version of .inject
   def my_inject (initial = nil, &block)
     return self.to_a[1..-1].my_inject(self.first, &block) if initial == nil
     accumulator = initial
     if block_given?
       self.my_each{|item| accumulator = yield accumulator, item}
     end
     accumulator
   end  
end
  
def multiply_els(arr)
  return arr.my_inject{|accum, item| accum * item}
end