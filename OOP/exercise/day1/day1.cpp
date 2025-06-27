#include <stdio.h>

int temp(int a, int b) {
    return a>b?a:b;
}

int temp(int a, int b, int c) {
    return a>b?a:b>c?b:c;
}

int temp2(int a=10, int b=20, int c=30) {
    return a>b?a:b>c?b:c;
}

int main() {
    int a = 10;
    int b = 20;
    int c = 30;
    printf("%d\n", temp(a, b));
    printf("%d\n", temp(a, b, c));
    printf("%d\n", temp2());
    return 0;
}