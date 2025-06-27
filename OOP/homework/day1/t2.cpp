#include <iostream>

int main() {
    int** arr = new int*[3];
    for (int i = 0; i < 3; ++i) {
        arr[i] = new int[3];
    }

    std::cout << "请输入一个3x3的整型数组 (9个整数):" << std::endl;
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            std::cin >> arr[i][j];
        }
    }

    int sum = 0;
    int min_val = arr[0][0];
    int max_val = arr[0][0];

    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < 3; ++j) {
            sum += arr[i][j];
            if (arr[i][j] < min_val) {
                min_val = arr[i][j];
            }
            if (arr[i][j] > max_val) {
                max_val = arr[i][j];
            }
        }
    }

    std::cout << "所有元素之和: " << sum << std::endl;
    std::cout << "最小值: " << min_val << std::endl;
    std::cout << "最大值: " << max_val << std::endl;

    for (int i = 0; i < 3; ++i) {
        delete[] arr[i];
    }
    delete[] arr;

    return 0;
}