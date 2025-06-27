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