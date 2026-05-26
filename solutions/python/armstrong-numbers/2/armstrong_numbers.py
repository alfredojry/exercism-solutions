def is_armstrong_number(number):
    total = 0
    digits = [int(chr) for chr in str(number)]
    pow_number = len(digits)
    for d in digits:
        total += d ** pow_number
    return total == number
