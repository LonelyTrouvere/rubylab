integer = 333

binary = ""

while integer != 0 do
    binary += (integer % 2).to_s
    integer /= 2
end

binary.reverse!

puts binary