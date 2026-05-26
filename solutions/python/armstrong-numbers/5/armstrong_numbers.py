"""
module excersism
"""
def is_armstrong_number(number):
    """
    checks the number
    """
    total = 0
    digits = [int(chr) for chr in str(number)]
    pow_number = len(digits)
    for digit in digits:
        total += digit ** pow_number
    return total == number
