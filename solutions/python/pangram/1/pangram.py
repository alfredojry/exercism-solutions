def is_pangram(sentence):
    sentence = sentence.lower()
    letters = [chr(value) for value in range(97, 123)]
    for letter in letters:
        if not letter in sentence:
            return False
    return True
