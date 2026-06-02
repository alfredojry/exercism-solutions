def color_code(color):
    colors_lst = colors()
    if color in colors_lst:
        return colors_lst.index(color)
    return 0


def colors():
    return [
        'black',
        'brown',
        'red',
        'orange',
        'yellow',
        'green',
        'blue',
        'violet',
        'grey',
        'white',
    ]
