B = Array.new(8, Array.new(8, 0))
Y = Array.new

8.times{
    Y.append(rand(10))
}

8.times{|i|
    8.times{|j|
        if i == j
            B[i][j] = 1
        else
            B[i][j] = rand(10)
        end
    }
}

ans = Array.new

8.times{|i|
    sum = 0
    8.times{|j|
        sum += B[i][j]*Y[i]
    }
    ans.append(sum)
}

puts ans