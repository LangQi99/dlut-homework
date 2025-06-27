#include <iostream>

class Clock{
    private:
        int hour, minute, second;
    public:
        ~Clock(){
            std::cout << "destroy" << std::endl;
        }
        Clock(int h = 0, int m = 0, int s = 0) : hour(h), minute(m), second(s) {}
        void setTime(int h, int m, int s){
            hour = h;
            minute = m;
            second = s;
        }
        void showTime(){
            std::cout << hour << ":" << minute << ":" << second << std::endl;
        }
};

int main(){
    Clock c(1,2,3);
    c.showTime();
    c.setTime(11, 11, 11);
    c.showTime();
    c.setTime(22, 22, 22);
    c.showTime();

    Clock *p = &c;
    p->setTime(33, 33, 33);
    p->showTime();

    Clock &r = c;
    r.setTime(44, 44, 44);
    r.showTime();
    
    {
        Clock localClock(12, 30, 45);
        localClock.showTime();
    }
    
    Clock* dynamicClock = new Clock(15, 20, 10);
    dynamicClock->showTime();
    delete dynamicClock;
    return 0;
}