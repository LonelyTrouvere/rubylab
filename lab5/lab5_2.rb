#var 5

def f(x, i)
    return ((-1)**i)*((x**(2*i+1))/(2*i+1))
end

def sum(x, n)

    x_l = 0.1
    x_r = 1.0
    n_l = 15
    n_r = 58

    if x < x_l || x > x_r
        return "#{} out of [#{x_l}, #{x_r}]"
    end

    ans = 0
    if n > n_l && n < n_r
        (0..n).each do |i|
            ans += yield(x, i)
          end
    else
        e = 0.001
        fault = e + 1
        prev = ans
        i = 0
        while i < 100 || fault > e
            ans += yield(x, i)

            i += 1
            fault = (prev - ans).abs
            prev = ans
        end
    end 

    return ans
end

puts "Finiti itterations: #{sum(0.2, 20.0){|x, i| f(x, i)}}"
puts "Infinite itterations: #{sum(0.2, 0.0){|x, i| f(x, i)}}"
puts "X out of bounds: #{sum(-1, 20.0){|x, i| f(x, i)}}"