def value(colors):
    lst_colors = [
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
    if colors[0] in lst_colors and colors[1] in lst_colors:
        return int(f'{lst_colors.index(colors[0])}{lst_colors.index(colors[1])}')
    return 0
