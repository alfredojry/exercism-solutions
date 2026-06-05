def resistor_label(colors):
    if 1 == len(colors):
        return f'{value(colors[0])} ohms'
    tolerance = tolerances(colors[-1])
    magnitude = label(colors[:-1])
    return f'{magnitude} ±{tolerance}'

def label(colors):
    factor = value(colors[:-1])
    zeros = color_code(colors[-1])
    ohms_value = factor * 10 ** zeros
    if ohms_value < 1e3:
        return f'{ohms_value} ohms'
    elif ohms_value < 1e6:
        qty = ohms_value / int(1e3)
        qty = may_int(qty)
        return f'{qty} kiloohms'
    elif ohms_value < 1e9:
        qty = ohms_value / int(1e6)
        qty = may_int(qty)
        return f'{qty} megaohms'
    qty = ohms_value / int(1e9)
    qty = may_int(qty)
    return f'{qty} gigaohms'

def may_int(qty):
    return qty if qty - int(qty) else int(qty)

def value(colors):
    return int(''.join([str(color_code(color)) for color in colors]))

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

def tolerances(color):
    dct = {
        'grey': '0.05%',
        'violet': '0.1%',
        'blue': '0.25%',
        'green': '0.5%',
        'brown': '1%',
        'red': '2%',
        'gold': '5%',
        'silver': '10%',
    }
    return dct.get(color, '')
