#include <iostream>

int main() {
    double a, b;
    std::cout << "请输入两个数字: ";
    std::cin >> a >> b;

    std::cout << a << " + " << b << " = " << a + b << std::endl;
    std::cout << a << " - " << b << " = " << a - b << std::endl;
    std::cout << a << " * " << b << " = " << a * b << std::endl;

    if (b != 0) {
        std::cout << a << " / " << b << " = " << a / b << std::endl;
    } else {
        std::cout << "除数不能为零。" << std::endl;
    }

    return 0;
}