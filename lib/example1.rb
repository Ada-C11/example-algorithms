
def example1(arr, first, last)
  if first < last
    p_index = partition(arr, first, last)
    example1(arr, first, p_index - 1)
    example1(arr, p_index + 1, last)
  end

  arr
end

def partition(arr, first, last)
  pivot = arr[last]
  p_index = first
  
  i = first
  while i < last
    if arr[i] <= pivot
      temp = arr[i]
      arr[i] = arr[p_index]
      arr[p_index] = temp
      p_index += 1
    end
    i += 1
  end
  temp = arr[p_index]
  arr[p_index] = pivot
  arr[last] = temp
  return p_index
end

puts "#{example1([3, 21, 6, 15, 1], 0, 4)}"
puts "#{example1([59, 13, 21, 15, 1], 0, 4)}"

