def fibs(n) 
  result = [0,1]
  while n > result.length
    result.push(result[-1] + result[-2])
  end
  result
end

def fibs_rec(n) 
  return [0,1][0..n] if n < 2
  arr = fibs_rec(n-1)
  arr << arr[-1] + arr[-2]
  p arr
end