# C++ 上机题作业 - 选做题

## 选做题：第2题扩展 - 动态申请n*m二维数组

### 题目要求

如果第2题改为n*m的数组，n和m均运行时输入，则需要动态申请二维数组，该如何实现？

### 实现思路

1. 在运行时输入数组的行数n和列数m
2. 使用双重指针动态申请二维数组
3. 先申请n个指针，每个指针再申请m个整数的空间
4. 输入数组元素并计算求和、最大值、最小值
5. 正确释放动态分配的内存

### 源代码

```cpp
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
```

### 关键实现要点

#### 1. 动态申请二维数组

```cpp
int** arr = new int*[n];        // 申请n个指针
for (int i = 0; i < n; ++i) {
    arr[i] = new int[m];        // 每个指针申请m个整数空间
}
```

#### 2. 内存释放

```cpp
for (int i = 0; i < n; ++i) {
    delete[] arr[i];            // 先释放每行的内存
}
delete[] arr;                   // 再释放指针数组
```

### 测试用例

#### 测试用例1：2x3数组

**输入：**

```
请输入数组的行数 n: 2
请输入数组的列数 m: 3
请输入一个2x3的整型数组 (6个整数):
1 2 3 4 5 6
```

**输出：**

```
所有元素之和: 21
最小值: 1
最大值: 6
```

#### 测试用例2：3x4数组

**输入：**

```
请输入数组的行数 n: 3
请输入数组的列数 m: 4
请输入一个3x4的整型数组 (12个整数):
10 20 30 40 50 60 70 80 90 100 110 120
```

**输出：**

```
所有元素之和: 780
最小值: 10
最大值: 120
```
