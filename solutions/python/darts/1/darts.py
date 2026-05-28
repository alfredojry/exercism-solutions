"""exercism"""
def score(x, y):
    """exercism"""
    # inner
    if is_inside(x, y, 1):
        return 10
    # middle
    if is_inside(x, y, 5):
        return 5
    # outer
    if is_inside(x, y, 10):
        return 1
    # outerside
    return 0

"""exercism"""
def is_inside(x, y, radius):
    """exercism"""
    return x ** 2  + y ** 2 <= radius ** 2
