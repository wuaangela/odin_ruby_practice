def bubble_sort(arr)

  until arr.each_cons(2).all? {|(x,y)| x <= y} 

    0..(arr.size - 1).times do |i|

      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    end
  end
 arr
end

print bubble_sort([7, 4, 2, 1, 3, 5, 6])

def bubble_sort_by(arr)
  sorted = false
  while sorted == false
    sorted = true
    0..(arr.size - 1).times do |i|
      if yield(arr[i], arr[i+1]) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
       end
     end
  end
  arr
end

arr = ["hi","hello", "yo", "i", "asdfasdf","hey"]
print bubble_sort_by(arr) {|x,y| x.length - y.length}