"""exercism"""
def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number < 1:
        raise ValueError('Classification is only possible for positive integers.')
    total = 0
    for factor in range(1, number // 2 + 1):
        total += factor if not number % factor else 0
    if total == number:
        return 'perfect'
    if total > number:
        return 'abundant'
    return 'deficient'
