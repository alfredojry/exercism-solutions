def is_triangle(sides):
    a, b, c = sides
    return (a * b * c != 0) and (a + b >= c) and (b + c >= a) and (a + c >= b)

def equilateral(sides):
    a, b, c = sides
    return is_triangle(sides) and a == b and a == c

def isosceles(sides):
    a, b, c = sides
    return  is_triangle(sides) and (a == b or a == c or b == c)

def scalene(sides):
    return is_triangle(sides) and not equilateral(sides) and not isosceles(sides)
