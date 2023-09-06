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

def deep_dup



end


def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    last_fibo = fibonacci(n-1)
    last_fibo << last_fibo[-1] + last_fibo[-2]
end