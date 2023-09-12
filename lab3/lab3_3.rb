def factorial(x)
    if x == 1
        return 1
    else
        return x * factorial(x-1)
    end
end

def task1(x, n)
    res = 1.0
    n.times{|i|
        part = (x ** (i+1))/(factorial(i+1).to_f)
        res += part
    }
    return res
end

puts "Task 1"
puts "Enter x:"
x = gets.chomp.to_f

puts "Enter n:"
n = gets.chomp.to_i

ans = task1(x, n)

puts "Result: #{ans}"

def sin_sum(n)
    res = 0.0
    n.times{|i|
        res += Math::sin(i+1)
    }

    return res
end

def task2(n)
    res = 0.0
    n.times{|i|
        res += 1/sin_sum(i+1)
    }
    return res
end

puts "Task 2"
puts "Enter n2:"
n2 = gets.chomp.to_i

ans2 = task2(n2)

puts "Result #{ans2}"