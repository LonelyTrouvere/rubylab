a = Array.new
b = Array.new

1...12.times{
    a.append(rand(100))
    b.append(rand(100))
}

c = Array.new

b.each{|i|
    c.append(i) if i % 2 == 0
}

b.each{|i|
    c.append(i) if i % 2 == 1
}

a.each{|i|
    c.append(i) if i % 2 == 1
}

a.each{|i|
    c.append(i) if i % 2 == 0
}

puts c