#include "difference_of_squares.h"

int square_of_sum(int number) {
    int count = 0;
    for (int i = 1; i <= number; i++) {
        count = count + i;
    }
    return count * count;
}

int sum_of_squares(int number) {
    int count = 0;
    for (int i = 1; i <= number; i++) {
        count = count + i * i;
    }
    return count;
}

int difference_of_squares(int number) {
    int a = sum_of_squares(number);
    int b = square_of_sum(number);
    if (a > b) {
        return a - b;
    }
    return b - a;
}
