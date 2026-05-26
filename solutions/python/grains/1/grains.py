def square(number):
    if 0 >= number or 64 < number:
        raise ValueError('square must be between 1 and 64')
    return 2 ** (number - 1)


def total():
    tot = 0
    for i in range(1, 65):
        tot += square(i)
    return tot
