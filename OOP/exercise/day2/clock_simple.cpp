#include <iostream>
#include <iomanip>

// 简单的时钟类演示
class Clock {
private:
    int hour, minute, second;
    
public:
    // 1. 构造函数 - 对象创建时自动调用
    Clock(int h = 0, int m = 0, int s = 0) {
        hour = h;
        minute = m;
        second = s;
        std::cout << "构造函数被调用，创建时钟对象" << std::endl;
    }
    
    // 2. 拷贝构造函数 - 用另一个对象初始化时调用
    Clock(const Clock& other) {
        hour = other.hour;
        minute = other.minute;
        second = other.second;
        std::cout << "拷贝构造函数被调用" << std::endl;
    }
    
    // 3. 析构函数 - 对象销毁时自动调用
    ~Clock() {
        std::cout << "析构函数被调用，销毁时钟对象" << std::endl;
    }
    
    // 4. 成员函数
    void setTime(int h, int m, int s) {
        hour = h;
        minute = m;
        second = s;
    }
    
    void showTime() {
        std::cout << std::setfill('0') << std::setw(2) << hour << ":"
                  << std::setfill('0') << std::setw(2) << minute << ":"
                  << std::setfill('0') << std::setw(2) << second << std::endl;
    }
    
    void addSeconds(int s) {
        second += s;
        // 简单的规范化
        if (second >= 60) {
            minute += second / 60;
            second %= 60;
        }
        if (minute >= 60) {
            hour += minute / 60;
            minute %= 60;
        }
        if (hour >= 24) {
            hour %= 24;
        }
    }
};

// 演示函数
void demonstrateBasicUsage() {
    std::cout << "=== 基本使用演示 ===" << std::endl;
    
    // 创建对象
    Clock c1(10, 30, 0);
    std::cout << "c1的时间: ";
    c1.showTime();
    
    // 修改时间
    c1.setTime(14, 45, 30);
    std::cout << "修改后c1的时间: ";
    c1.showTime();
    
    // 增加秒数
    c1.addSeconds(3600); // 增加1小时
    std::cout << "增加1小时后c1的时间: ";
    c1.showTime();
}

void demonstrateCopyConstructor() {
    std::cout << "\n=== 拷贝构造函数演示 ===" << std::endl;
    
    Clock original(12, 0, 0);
    std::cout << "原始对象时间: ";
    original.showTime();
    
    // 使用拷贝构造函数
    Clock copy(original);
    std::cout << "拷贝对象时间: ";
    copy.showTime();
    
    // 修改原始对象
    original.setTime(15, 30, 0);
    std::cout << "修改后原始对象时间: ";
    original.showTime();
    std::cout << "拷贝对象时间（应该不变）: ";
    copy.showTime();
}

void demonstratePointersAndReferences() {
    std::cout << "\n=== 指针和引用演示 ===" << std::endl;
    
    Clock c(9, 15, 0);
    std::cout << "原始时间: ";
    c.showTime();
    
    // 指针操作
    Clock* p = &c;
    p->setTime(11, 30, 0);
    std::cout << "通过指针修改后: ";
    c.showTime();
    
    // 引用操作
    Clock& r = c;
    r.addSeconds(1800); // 增加30分钟
    std::cout << "通过引用增加30分钟后: ";
    c.showTime();
}

void demonstrateObjectLifetime() {
    std::cout << "\n=== 对象生命周期演示 ===" << std::endl;
    
    std::cout << "进入函数作用域" << std::endl;
    {
        Clock temp(1, 2, 3);
        std::cout << "临时对象时间: ";
        temp.showTime();
    } // 这里temp对象会被销毁，析构函数被调用
    std::cout << "离开函数作用域" << std::endl;
}

int main() {
    std::cout << "面向对象时钟类基础教程" << std::endl;
    std::cout << "========================" << std::endl;
    
    demonstrateBasicUsage();
    demonstrateCopyConstructor();
    demonstratePointersAndReferences();
    demonstrateObjectLifetime();
    
    std::cout << "\n程序结束" << std::endl;
    return 0;
} 