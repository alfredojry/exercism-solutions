def is_valid(isbn):
    isbn = isbn.replace('-', '')
    if len(isbn) != 10 or not isbn[:9].isdigit() or (not isbn[9].isdigit() and isbn[9] != 'X'):
        return False
    total = 0
    for factor in range(10, 0, -1):
        ch = isbn[10 - factor]
        digit = int(ch) if ch.isdigit() else 10
        total += factor * digit
    return not total % 11
