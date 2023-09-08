binary = "10101010101010"
binary.reverse!

ans = 0

binary.length.times{ |i|
    k = binary[i].to_i

    ans += k * 2 ** i
}

puts ans