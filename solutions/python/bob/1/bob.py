"""exercism"""

import re

def response(hey_bob):
    """exercism"""
    hey_bob = hey_bob.strip()
    is_silence = not hey_bob
    if is_silence:
        return 'Fine. Be that way!'
    is_any_letters = re.search('[A-Za-z]', hey_bob)
    is_all_capital = is_any_letters and hey_bob.upper() == hey_bob
    is_question = hey_bob.endswith('?')
    if is_all_capital and is_question:
        return 'Calm down, I know what I\'m doing!'
    if is_all_capital:
        return 'Whoa, chill out!'
    if is_question:
        return 'Sure.'
    return 'Whatever.'
