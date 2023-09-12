include Math
N = 10
C = 20

def y(x)
    (x ** (((N-C)**2 + 4*N*C)/(N**2 - C**2))) ** (1/N) + (x/N + 12)/(6 - C*x)
end

def z(x)
    (1 - cos(4*x))/(cos(2*x)**(-2) - 1) + (1 + cos(4*x))/(sin(2*x)**(-2) - 1) + tg(2*PI/9 - x) ** (C/N)
end

def y_tab
  res = {}
  (1..N).step((N - 1).to_f / (N + C)) do |i|
    puts i
    res[i] = y(i)
  end
  res
end

def z_tab
  res = {}
  i = PI / N
  delta = (PI - PI / N) / ((3.0/2)*N + C)
  while i <= PI do
    res[i] = z(i)
    i += delta
  end

  res
end

def y_z_tab
  res = {}
  (2..C).step((C - 2).to_f / (2*N)) do |j|
    if j > 2 && j < N
      res[j] = y(j)
    elsif j > N && j < 2*N
      res[j] = z(j)
    else
      res[j] = y(j) + z(j)
    end
  end

  res
end

def print_result(dict)
  dict.each { |i|
    print i.to_s + ": " + dict[i].to_s + "\n"
  }

  print "\n"
end


print "__Y_TABULATION__\n"
print_result(y_tab)
print "__Z_TABULATION__\n"
print_result(z_tab)
print "__Y_Z_TABULATION__\n"
print_result(y_z_tab)