#include <iostream>
#include <cmath>
using namespace std;

// 前向声明
class Line;

// Point类
class Point {
private:
    double x, y;
    
public:
    Point(double x = 0, double y = 0) : x(x), y(y) {}
    
    // 友元函数声明 - 允许Line类访问Point的私有成员
    friend double distance(const Point& p1, const Point& p2);
    friend double pointToLineDistance(const Point& p, const Line& l);
    friend class Line;  // Line类作为Point的友元类
    
    void display() const {
        cout << "Point(" << x << ", " << y << ")" << endl;
    }
    
    // 获取坐标的公共接口
    double getX() const { return x; }
    double getY() const { return y; }
};

// Line类
class Line {
private:
    Point start, end;
    
public:
    Line(const Point& s, const Point& e) : start(s), end(e) {}
    
    // 由于Line是Point的友元类，可以直接访问Point的私有成员
    double length() const {
        double dx = end.x - start.x;  // 直接访问Point的私有成员x
        double dy = end.y - start.y;  // 直接访问Point的私有成员y
        return sqrt(dx * dx + dy * dy);
    }
    
    void display() const {
        cout << "Line from ";
        start.display();
        cout << " to ";
        end.display();
        cout << "Length: " << length() << endl;
    }
    
    // 友元函数声明 - 计算点到直线的距离
    friend double pointToLineDistance(const Point& p, const Line& l);
};

// 友元函数实现 - 计算两点间距离
double distance(const Point& p1, const Point& p2) {
    double dx = p2.x - p1.x;  // 直接访问Point的私有成员
    double dy = p2.y - p1.y;  // 直接访问Point的私有成员
    return sqrt(dx * dx + dy * dy);
}

// 友元函数实现 - 计算点到直线的距离
double pointToLineDistance(const Point& p, const Line& l) {
    // 使用点到直线距离公式: |Ax + By + C| / sqrt(A^2 + B^2)
    // 其中直线方程为: (y2-y1)x - (x2-x1)y + (x2-x1)y1 - (y2-y1)x1 = 0
    
    double x1 = l.start.x, y1 = l.start.y;
    double x2 = l.end.x, y2 = l.end.y;
    double x0 = p.x, y0 = p.y;
    
    double A = y2 - y1;
    double B = x1 - x2;
    double C = x2 * y1 - x1 * y2;
    
    return abs(A * x0 + B * y0 + C) / sqrt(A * A + B * B);
}

int main() {
    cout << "=== 友元函数示例：Point和Line类 ===" << endl;
    
    // 创建点
    Point p1(1, 2);
    Point p2(4, 6);
    Point p3(2, 3);
    
    cout << "\n1. 创建的点：" << endl;
    p1.display();
    p2.display();
    p3.display();
    
    // 使用友元函数计算距离
    cout << "\n2. 使用友元函数计算距离：" << endl;
    cout << "p1到p2的距离: " << distance(p1, p2) << endl;
    cout << "p2到p3的距离: " << distance(p2, p3) << endl;
    
    // 创建直线
    Line line(p1, p2);
    cout << "\n3. 创建的直线：" << endl;
    line.display();
    
    // 使用友元函数计算点到直线的距离
    cout << "\n4. 使用友元函数计算点到直线的距离：" << endl;
    cout << "p3到直线的距离: " << pointToLineDistance(p3, line) << endl;
    
    // 演示友元类可以直接访问私有成员
    cout << "\n5. 友元类Line可以直接访问Point的私有成员：" << endl;
    cout << "直线长度计算中直接使用了Point的x, y私有成员" << endl;
    
    return 0;
}
