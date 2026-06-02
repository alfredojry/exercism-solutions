def label(colors):
    tens = value(colors[:2])
    zeros = color_code(colors[2])
    ohms_value = tens * 10 ** zeros
    if ohms_value < 1e3:
        return f'{ohms_value} ohms'
    elif ohms_value < 1e6:
        qty = ohms_value // int(1e3)
        return f'{qty} kiloohms'
    elif ohms_value < 1e9:
        qty = ohms_value // int(1e6)
        return f'{qty} megaohms'
    qty = ohms_value // int(1e9)
    return f'{qty} gigaohms'
        

def value(colors):
    return int(f'{color_code(colors[0])}{color_code(colors[1])}')

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
