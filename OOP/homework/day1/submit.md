# C++ 上机题作业

## 1. 输入输出流运算符的加减乘除

### 源代码
```cpp
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
```

### 输入
```
23 123
```
### 输出
```
请输入两个数字: 23 123
23 + 123 = 146
23 - 123 = -100
23 * 123 = 2829
23 / 123 = 0.186991
```
### 运行截图（黑窗口）
```shell
// 此处插入运行截图
```

---

## 2. new/delete动态分配3x3数组，求和、最大最小

### 源代码
```cpp
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
```

### 输入
```
1 2 3 4 5 6 7 8 9
```
### 输出
```
请输入一个3x3的整型数组 (9个整数):
所有元素之和: 45
最小值: 1
最大值: 9
```
### 运行截图（黑窗口）
```shell
// 此处插入运行截图
```

---

## 3. 百钱问题

### 源代码
```cpp
#include <iostream>

int main() {
    int count = 0;
    for (int i = 0; i * 5 <= 100; ++i) {
        for (int j = 0; i * 5 + j * 2 <= 100; ++j) {
            int k = 100 - i * 5 - j * 2;
            if (k >= 0) {
                count++;
            }
        }
    }
    std::cout << "将1元人民币兑换成1,2,5分的人民币, 共有 " << count << " 种换法。" << std::endl;
    return 0;
}
```

### 输出
```
将1元人民币兑换成1,2,5分的人民币, 共有 121 种换法。
```
### 运行截图（黑窗口）
```shell
// 此处插入运行截图
```

---

## 4. swap函数交换主函数变量

### 源代码
```cpp
#include <iostream>

void swap(int &x, int &y) {
    int temp = x;
    x = y;
    y = temp;
}

int main() {
    int a = 5;
    int b = 10;

    std::cout << "交换前: a = " << a << ", b = " << b << std::endl;
    swap(a, b);
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl;

    return 0;
}
```

### 输出
```
交换前: a = 5, b = 10
交换后: a = 10, b = 5
```
### 运行截图（黑窗口）
```shell
// 此处插入运行截图
```

---

## 5. 生日悖论概率计算

### 源代码
```cpp
#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <iomanip>

int main() {
    srand(time(0));

    int n;
    std::cout << "输入同学的人数 n: ";
    std::cin >> n;

    double p = 1.0;
    if (n > 365) {
        p = 0.0;
    } else {
        for (int i = 0; i < n; ++i) {
            p *= (365.0 - i) / 365.0;
        }
    }
    std::cout << std::fixed << std::setprecision(10);
    std::cout << "理论上生日不重复的概率: " << p << std::endl;
    
    int trials = 100000;
    int success = 0;

    for (int i = 0; i < trials; ++i) {
        bool used[366] = {false};
        bool duplicate = false;
        for (int j = 0; j < n; ++j) {
            int day = rand() % 365 + 1;
            if (used[day]) {
                duplicate = true;
                break;
            }
            used[day] = true;
        }
        if (!duplicate) {
            success++;
        }
    }

    double p_sim = static_cast<double>(success) / trials;
    std::cout << "仿真方法得出不重复概率: " << p_sim << std::endl;

    return 0;
}
```

### 输入
```
50
```
### 输出（部分）
```
输入同学的人数 n: 50
理论上生日不重复的概率: 0.0296264202
仿真方法得出不重复概率: 0.0297xxxxxx
```
### 运行截图（黑窗口）
```shell
// 此处插入运行截图
```