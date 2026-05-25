def leap_year(year):
    if 0 == year % 100 :
        return 0 == year % 400
    return 0 == year % 4
