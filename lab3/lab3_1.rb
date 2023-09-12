include Math

a = true
b = false
c = true
x1 = 50
y = 10
z = 5

exp_a = !(a || b) && (a && !b)
puts exp_a
exp_b = ((z != y).object_id <= (6 >= y).object_id && a || b && c && x1).object_id >= 1.5
puts exp_b
exp_c = (8 - x1*2 <= z ) && (x1 ** 2 >= y ** 2) || (z >= 15)
puts exp_c
exp_d = (x1 > 0) && (y < 0) || (z >= (x1*y) - (-y/x1) + (-z)/2)
puts exp_d
exp_e = !(a || b && !(c || (!a || b)))
puts exp_e
exp_f = (((x1 ** 2 + y ** 2) >= (1 && x1)).object_id >= (0 && y)).object_id >= 0 
puts exp_f
exp_g = (a && (c && b != b || a) || c) && b
puts exp_g

x2 = 4.5
p = true

task_2 = !(exp(x2 ** 2) - sin(x2) < PI) && (p || !p)
puts task_2