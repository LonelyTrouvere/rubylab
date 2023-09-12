include Math

puts "Enter x: "
x = gets.chomp.to_f

y = 0

case x
    when -4..0
        y = ((x-2).abs/(x**2 * cos(x))) ** (1.0/7.0)
    when 0..12
        y = 1/((tg(x + 1/exp(x))/(sin(x) ** 2)) ** (2.0/7.0))
    else
        y = 1/(1+x/(1+x/(1+x)))
end

puts "Result: #{y}"