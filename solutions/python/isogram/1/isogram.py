def is_isogram(string):
    string = string.lower()
    lst = [c for c in string]
    letters = [chr(value) for value in range(97, 123)]
    for letter in letters:
        if lst.count(letter) > 1:
            return False
    return True
