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