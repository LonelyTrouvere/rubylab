EPS = 0.00001

def factorial(x)
    if x == 1
        return 1
    else
        return x * factorial(x-1)
    end
end

def first_sum
    sum = 0
    n = 2

    while true
        to_add = (factorial(n-1).to_f/factorial(n+1).to_f) ** (n*(n+1))

        if to_add < EPS
            break
        end

        sum += to_add
        n += 1
    end

    return sum
end

def second_sum(x)
    x = x.to_f
    sum = 1/x
    n = 1.0

    while true
        to_add = ((2*((-1) ** n)*(2 ** (2*n) - 1))/factorial(2*n).to_f)*(n ** (6/7) * x ** (2*n - 1)).to_f

        if to_add < EPS
            break
        end

        sum += to_add
        n += 1
    end

    return sum
end

def csch(x)
    x = x.to_f
    2/(Math::exp(x) - Math::exp(-x))
end

def third_sum
    sum = 0
    n = 1.0

    while true
        to_add = (factorial(3*n-2)*factorial(2*n-1)).to_f/(factorial(4*n)*(5 ** (2*n))*factorial(2*n)).to_f

        if to_add < EPS
            break
        end

        sum += to_add
        n += 1
    end

    return sum
end

puts "Task1: #{first_sum}"
puts "Enter x: "

x = gets.chomp
puts "cshc: #{csch(x)}"
puts "Task2: #{second_sum(x)}"

puts "Task3: #{third_sum}"