#include <iostream>
using namespace std;
class Time {
    int h, m, s;
public:
    Time(int h1=0, int m1=0, int s1=0) {
        h = h1; m = m1; s = s1;
        if (h < 0) h = 0; if (h > 23) h = 23;
        if (m < 0) m = 0; if (m > 59) m = 59;
        if (s < 0) s = 0; if (s > 59) s = 59;
    }
    ~Time() { cout << "Time析构" << endl; }
    void set(int h1, int m1, int s1) {
        h = h1; m = m1; s = s1;
        if (h < 0) h = 0; if (h > 23) h = 23;
        if (m < 0) m = 0; if (m > 59) m = 59;
        if (s < 0) s = 0; if (s > 59) s = 59;
    }
    void set_sec(int s1) { h = 0; m = 0; s = s1; if (s < 0) s = 0; if (s > 59) s = 59; }
    void tick() {
        s++;
        if (s == 60) { s = 0; m++; }
        if (m == 60) { m = 0; h++; }
        if (h == 24) h = 0;
    }
    void print() {
        if (h < 10) cout << 0;
        cout << h << ":";
        if (m < 10) cout << 0;
        cout << m << ":";
        if (s < 10) cout << 0;
        cout << s << endl;
    }
};
int main() {
    Time t1(23,59,59); // 下一天
    t1.tick(); t1.print();
    Time t2(12,34,59); // 下一分钟
    t2.tick(); t2.print();
    Time t3(14,59,59); // 下一小时
    t3.tick(); t3.print();
    Time t4(0,0,59); // 00:00:59 -> 00:01:00
    t4.tick(); t4.print();
    Time t5(0,59,59); // 00:59:59 -> 01:00:00
    t5.tick(); t5.print();
    return 0;
} 