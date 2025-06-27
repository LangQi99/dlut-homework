#include <iostream>

int main() {
    int n, m;
    
    // 输入数组的行数和列数
    std::cout << "请输入数组的行数 n: ";
    std::cin >> n;
    std::cout << "请输入数组的列数 m: ";
    std::cin >> m;
    
    // 动态申请二维数组
    int** arr = new int*[n];
    for (int i = 0; i < n; ++i) {
        arr[i] = new int[m];
    }

    std::cout << "请输入一个" << n << "x" << m << "的整型数组 (" << n * m << "个整数):" << std::endl;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            std::cin >> arr[i][j];
        }
    }

    // 计算求和、最大值、最小值
    int sum = 0;
    int min_val = arr[0][0];
    int max_val = arr[0][0];

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
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

    // 释放动态分配的内存
    for (int i = 0; i < n; ++i) {
        delete[] arr[i];
    }
    delete[] arr;

    return 0;
} 