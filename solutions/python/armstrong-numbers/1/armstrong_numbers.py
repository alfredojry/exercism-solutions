def is_armstrong_number(number):
    total = 0
    digits = [int(ch) for ch in str(number)]
    pow = len(digits)
    for d in digits:
        total += d ** pow
    return total == number
