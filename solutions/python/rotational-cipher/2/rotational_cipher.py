def rotate(text, key):
    key = key % 26
    result = ''
    min_upper_ord, max_upper_ord, min_lower_ord, max_lower_ord = 65, 90, 97, 122
    for letter in text:
        ord_val = ord(letter)
        if (min_upper_ord <= ord_val <= max_upper_ord):
            new_ord = ord_val + key
            diff = max_upper_ord - new_ord
            if diff < 0:
                new_ord = min_upper_ord - diff - 1
            result += chr(new_ord)
        elif (min_lower_ord <= ord_val <= max_lower_ord):
            new_ord = ord_val + key
            diff = max_lower_ord - new_ord
            if diff < 0:
                new_ord = min_lower_ord - diff - 1
            result += chr(new_ord)
        else:
            result += letter
    return result
