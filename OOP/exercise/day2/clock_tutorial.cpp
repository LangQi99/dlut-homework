#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>

// 前向声明
class Clock;

// 友元函数声明
void displayClockInfo(const Clock& c);

class Clock {
private:
    int hour, minute, second;
    static int clockCount;  // 静态成员变量，记录创建的时钟对象数量
    
public:
    // 构造函数
    Clock(int h = 0, int m = 0, int s = 0) : hour(h), minute(m), second(s) {
        normalizeTime();  // 规范化时间
        clockCount++;
        std::cout << "构造函数被调用，创建时钟对象 #" << clockCount << std::endl;
    }
    
    // 拷贝构造函数
    Clock(const Clock& other) : hour(other.hour), minute(other.minute), second(other.second) {
        clockCount++;
        std::cout << "拷贝构造函数被调用，创建时钟对象 #" << clockCount << std::endl;
    }
    
    // 析构函数
    ~Clock() {
        std::cout << "析构函数被调用，销毁时钟对象" << std::endl;
    }
    
    // 赋值运算符重载
    Clock& operator=(const Clock& other) {
        if (this != &other) {
            hour = other.hour;
            minute = other.minute;
            second = other.second;
        }
        return *this;
    }
    
    // 加法运算符重载（时钟相加）
    Clock operator+(const Clock& other) const {
        Clock result(hour + other.hour, minute + other.minute, second + other.second);
        return result;
    }
    
    // 比较运算符重载
    bool operator==(const Clock& other) const {
        return hour == other.hour && minute == other.minute && second == other.second;
    }
    
    bool operator<(const Clock& other) const {
        return getTotalSeconds() < other.getTotalSeconds();
    }
    
    // 前置递增运算符
    Clock& operator++() {
        second++;
        normalizeTime();
        return *this;
    }
    
    // 后置递增运算符
    Clock operator++(int) {
        Clock temp(*this);
        second++;
        normalizeTime();
        return temp;
    }
    
    // 输入输出运算符重载（需要友元函数）
    friend std::ostream& operator<<(std::ostream& os, const Clock& c);
    friend std::istream& operator>>(std::istream& is, Clock& c);
    
    // 友元函数
    friend void displayClockInfo(const Clock& c);
    
    // 成员函数
    void setTime(int h, int m, int s) {
        hour = h;
        minute = m;
        second = s;
        normalizeTime();
    }
    
    void showTime() const {
        std::cout << std::setfill('0') << std::setw(2) << hour << ":"
                  << std::setfill('0') << std::setw(2) << minute << ":"
                  << std::setfill('0') << std::setw(2) << second << std::endl;
    }
    
    void addSeconds(int s) {
        second += s;
        normalizeTime();
    }
    
    void addMinutes(int m) {
        minute += m;
        normalizeTime();
    }
    
    void addHours(int h) {
        hour += h;
        normalizeTime();
    }
    
    // 获取总秒数
    int getTotalSeconds() const {
        return hour * 3600 + minute * 60 + second;
    }
    
    // 静态成员函数
    static int getClockCount() {
        return clockCount;
    }
    
    static void resetClockCount() {
        clockCount = 0;
    }
    
    // 获取时间字符串
    std::string getTimeString() const {
        std::stringstream ss;
        ss << std::setfill('0') << std::setw(2) << hour << ":"
           << std::setfill('0') << std::setw(2) << minute << ":"
           << std::setfill('0') << std::setw(2) << second;
        return ss.str();
    }
    
private:
    // 私有辅助函数：规范化时间
    void normalizeTime() {
        int totalSeconds = getTotalSeconds();
        hour = totalSeconds / 3600 % 24;
        minute = (totalSeconds % 3600) / 60;
        second = totalSeconds % 60;
    }
};

// 静态成员变量定义
int Clock::clockCount = 0;

// 友元函数实现
void displayClockInfo(const Clock& c) {
    std::cout << "时钟信息 - 时间: " << c.getTimeString() 
              << ", 总秒数: " << c.getTotalSeconds() << std::endl;
}

// 输出运算符重载
std::ostream& operator<<(std::ostream& os, const Clock& c) {
    os << std::setfill('0') << std::setw(2) << c.hour << ":"
       << std::setfill('0') << std::setw(2) << c.minute << ":"
       << std::setfill('0') << std::setw(2) << c.second;
    return os;
}

// 输入运算符重载
std::istream& operator>>(std::istream& is, Clock& c) {
    std::cout << "请输入时间 (时:分:秒): ";
    char colon1, colon2;
    is >> c.hour >> colon1 >> c.minute >> colon2 >> c.second;
    c.normalizeTime();
    return is;
}

// 演示函数
void demonstrateConstructors() {
    std::cout << "\n=== 构造函数演示 ===" << std::endl;
    
    Clock c1;           // 默认构造函数
    Clock c2(12, 30, 45);  // 带参数构造函数
    Clock c3(c2);       // 拷贝构造函数
    
    std::cout << "c1: "; c1.showTime();
    std::cout << "c2: "; c2.showTime();
    std::cout << "c3: "; c3.showTime();
}

void demonstrateOperators() {
    std::cout << "\n=== 运算符重载演示 ===" << std::endl;
    
    Clock c1(10, 30, 0);
    Clock c2(2, 15, 30);
    
    std::cout << "c1: " << c1 << std::endl;
    std::cout << "c2: " << c2 << std::endl;
    
    Clock c3 = c1 + c2;
    std::cout << "c1 + c2 = " << c3 << std::endl;
    
    std::cout << "c1 == c2: " << (c1 == c2 ? "true" : "false") << std::endl;
    std::cout << "c1 < c2: " << (c1 < c2 ? "true" : "false") << std::endl;
    
    std::cout << "++c1: " << ++c1 << std::endl;
    std::cout << "c1++: " << c1++ << std::endl;
    std::cout << "c1: " << c1 << std::endl;
}

void demonstrateStaticMembers() {
    std::cout << "\n=== 静态成员演示 ===" << std::endl;
    
    std::cout << "当前时钟对象数量: " << Clock::getClockCount() << std::endl;
    
    Clock c1(1, 0, 0);
    Clock c2(2, 0, 0);
    
    std::cout << "创建两个时钟后，对象数量: " << Clock::getClockCount() << std::endl;
}

void demonstrateFriendFunction() {
    std::cout << "\n=== 友元函数演示 ===" << std::endl;
    
    Clock c(15, 45, 30);
    displayClockInfo(c);
}

void demonstratePointersAndReferences() {
    std::cout << "\n=== 指针和引用演示 ===" << std::endl;
    
    Clock c(9, 15, 0);
    std::cout << "原始时间: "; c.showTime();
    
    // 指针操作
    Clock* p = &c;
    p->addHours(2);
    std::cout << "通过指针增加2小时后: "; c.showTime();
    
    // 引用操作
    Clock& r = c;
    r.addMinutes(30);
    std::cout << "通过引用增加30分钟后: "; c.showTime();
}

void demonstrateInputOutput() {
    std::cout << "\n=== 输入输出运算符演示 ===" << std::endl;
    
    Clock c;
    std::cin >> c;
    std::cout << "您输入的时间是: " << c << std::endl;
}

int main() {
    std::cout << "面向对象时钟类教程演示" << std::endl;
    std::cout << "========================" << std::endl;
    
    demonstrateConstructors();
    demonstrateOperators();
    demonstrateStaticMembers();
    demonstrateFriendFunction();
    demonstratePointersAndReferences();
    demonstrateInputOutput();
    
    std::cout << "\n程序结束，总共创建了 " << Clock::getClockCount() << " 个时钟对象" << std::endl;
    
    return 0;
} 