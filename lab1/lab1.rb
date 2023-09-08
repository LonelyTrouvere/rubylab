include Math

puts "Enter x: "
x = gets.chomp.to_f

puts "Enter t: "
t = gets.chomp.to_f

puts "Enter z: "
z = gets.chomp.to_f

res = exp(tan(x) ** 2) + (sqrt((t - z).abs))/(cos(PI ** 2) ** 3 + exp(PI) * (z ** 2)) + 2.3 * (10 ** 1.6)

puts "Result: #{res}"
