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

# p exponentiation(2, 3)
# p exp(2,3)