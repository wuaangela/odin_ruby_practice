def stock_picker(arr)
    highest_diff = 0
    highest_pair = []
  
    arr.each_with_index do |num, index|
  
      for i in 0..index
  
        if num - arr[i] > highest_diff
          highest_diff = num - arr[i]
          highest_pair = [i, index]
        end
  
      end
    end
  
    puts "The profit is #{highest_diff} is you buy on day #{highest_pair[0]} and sell on day #{highest_pair[1]}"
    return highest_pair
  
  end
  
  stock_picker([17,3,6,9,15,8,6,1,10])