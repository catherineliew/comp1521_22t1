#include <stdio.h>

int factorial(int num);
int factorial_recursive(int num);

int main(void) {
    
    int x = factorial_recursive(4);
    printf("%d", x);

    return 0;
}

// 4! = 4 * 3 * 2 * 1
//    = 4 * 3!

// 0! = 1

// Iterative approach
int factorial(int num) {
    int result = 1;
    for (int i = num; i >= 1; i--){
        result *= i;
    }

    // same as:
    // int result = 1;
    // int i = num;
    // while (i >= 1) {
    //     result *= i;
    //     i--;
    // }


    return result;
}

// Recursive approach
int factorial_recursive(int num){
    if (num == 0) {
        return 1;
    }
    return (num * factorial_recursive(num - 1));
}
