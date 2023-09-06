def range(start, last)
    return start if start == last - 1
    new_arr = [start]
    new_arr << range(start+1, last) 
    new_arr.flatten
end

def exponentiation(b,n)
    return 1 if n == 0
    return b if n == 1
    b * exponentiation(b, n-1)
end

def exp(b,n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
       return exp(b, n / 2) ** 2  
    elsif n.odd?
       return b * (exp(b, (n - 1) / 2) ** 2)
    end
end

def deep_dup(array)
    return array if !array.is_a?(Array)
    new_array = []
    array.each do |ele|
        new_array << deep_dup(ele)
    end
   new_array
end

def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    last_fibo = fibonacci(n-1)
    last_fibo << last_fibo[-1] + last_fibo[-2]
end

# def bsearch(array, target)
#     return nil if array.empty?
#     return array.length - 1 if array[-1] == target  
#     bsearch(array[0...-1], target)
# end

def bsearch(array, target)
    middle = array.length / 2
    return middle if array[middle] == target
    return nil if array.empty?

    if array[middle] > target
        return bsearch(array[0...middle], target)
    else
        if bsearch(array[(middle+1)..-1], target) != nil
            return middle + 1 + bsearch(array[(middle+1)..-1], target)
        else 
            return nil
        end
    end
end


def merge_sort(array)
 #   return [] if array.length == 0
    return array if array.length <=1
    middle = array.length / 2
    first_half = array[0...middle]
    second_half = array[middle..-1]
     merge(merge_sort(first_half) , merge_sort(second_half))
end

def merge(array1, array2)
    new_array = []
    i = 0
    x = 0
    while i < array1.length && x < array2.length
        if array1[i] < array2[x]
            new_array << array1[i] 
            i += 1
        else
            new_array << array2[x]
            x += 1
        end
    end

    if i == array1.length
        new_array += array2[x...array2.length]
    else
        new_array += array1[i...array1.length]
    end
    new_array
end

def subsets(array)
    return [] if array.empty?
    return [[], [1]] if array.length == 1
    last_num = array[-1]
    new_arr = subsets(array[0...-1]) 
    old_arr = subsets(array[0...-1]) 
    
    new_arr.map do |sub|
        sub << last_num
    end

    old_arr + new_arr
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]] 
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]