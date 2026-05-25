#include "grains.h"

uint64_t square(uint8_t index) {
    if (1 > index) {
        return 0;
    }
    if (1 == index) {
        return 1;
    }
    return 2 * square(index - 1);
}

uint64_t total() {
    uint64_t sum = 0;
    for (int i = 1; i <= 64; i++) {
        sum += square(i);
    }
    return sum;
}
