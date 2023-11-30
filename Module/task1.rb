def check(a, b, c)
    ac = a.to_i
    bc = b.to_i
    cc = c.to_i

    return ~(ac | bc) & (ac ^ cc)

end

def f(a, b, c, xs, xe, dx)

    res = Array.new

    out = check(a, b, c)

    while xs <= xe
        if xs < 3 && b != 0 
            res.append(a*xs**2 - b*xs + c)
        elsif xs > 3 && b == 0
            res.append((xs-a)/(xs-c))
        else
            res.append(xs/c)
        end

        xs = xs+dx

    end

    if out == 0
        res = res.map do |element|
            element.to_i
        end
    end

    return res
end

require 'minitest/autorun'

class TestFunctionF < Minitest::Test
  def test1
    result = f(2, 3, 1, 1, 5, 1)
    assert_equal [1, 0, 3, 3, 4, 5], result
  end

  def test2
    result = f(1, 2, 3, -10, 10, 1)
    assert_equal [123, 102, 83, 66, 51, 38, 27, 18, 11, 6, 3, 2, 3, 1, 1, 1, 2, 2, 2, 3, 3], result
  end

  def test3
    result = f(1, 2, 3, 1, 5, 1)
    assert_equal [0, -4, -6, -6, -4, 0], result
  end

  def test4
    result = f(-2, 1, 3, -5, 5, 1)
    assert_equal [7, 9, 8, 6, 3, -1, -7, -14, -22, -31, -41, -52], result
  end

  def test5
    result = f(3, 2, 0, -5, 5, 1)
    assert_equal [15, 10, 7, 5, 3, 2, 1, 0, -1, -2, -3, -5], result
  end

  def test6
    result = f(2, 1, 4, 5, 1, 1)
    assert_equal [], result
  end
end
