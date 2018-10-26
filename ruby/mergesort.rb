def merge_sort(arr, p=0, r = arr.length - 1)
  return arr if p >= r
  # divide
  q = p+r/2
  leftArr = arr[0..q]
  rightArr = arr[q+1..r]
  # conquer
  leftArr = merge_sort(leftArr)
  rightArr = merge_sort(rightArr)
  # combine
  merge(leftArr, rightArr)
end

def merge(left, right)
  result = []
  while !left.empty? and !right.empty?
    if left[0] <= right[0]
      result.push(left.shift)
    else
      result.push(right.shift)
    end
  end

  while !left.empty? 
    result.push(left.shift)
  end

  while !right.empty?
    result.push(right.shift)
  end
  result
end

merge_sort([3,1,2,7,4])