# var 11

def get_h(a, b, n)
    return (b - a) / n
end

def prm(a, b)
    a, b = b, a if a > b
    h = get_h(a, b, 10)
    sum = 0

    curr = a
    while curr < b
        sum += yield(curr)
        curr += h
    end

    return sum*h
end

def trp(a, b)
    a, b = b, a if a > b
    h = get_h(a, b, 10)
    sum = yield(a)/2

    curr = a
    while curr < b
        sum += yield(curr)
        curr += h
    end

    sum += yield(b)/2

    return sum*h
end

def f1(x)
    return 1/((x+1)*Math.sqrt(x**2+1))
end

def f2(x)
    return x*Math.atan(x)
end

puts "Rectangle for f1: #{prm(0.0, 0.6){|x| f1(x)}}"
puts "Ractangle for f2: #{prm(0.2, 1.6){|x| f2(x)}}"
puts "Trapezoid for f1: #{trp(0.0, 0.6){|x| f1(x)}}"
puts "Trapezoid for f2: #{trp(0.2, 1.6){|x| f2(x)}}"