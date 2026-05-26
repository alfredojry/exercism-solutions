"""
excersism
"""
def steps(number):
    """
    excersism
    """
    if number < 1:
        raise ValueError('Only positive integers are allowed')
    steps_count = 0
    while number > 1:
        number = number / 2 if number % 2 == 0 else 3 * number + 1
        steps_count += 1
    return steps_count
