#include <iostream>
#include <cstring>
using namespace std;

class String {
private:
    char* data;
    int length;
    
public:
    // 构造函数
    String(const char* str = "") {
        length = strlen(str);
        data = new char[length + 1];
        strcpy(data, str);
        cout << "构造函数被调用" << endl;
    }
    
    // 深拷贝构造函数
    String(const String& other) {
        length = other.length;
        data = new char[length + 1];  // 分配新的内存空间
        strcpy(data, other.data);     // 复制数据
        cout << "深拷贝构造函数被调用" << endl;
    }
    
    // 深拷贝赋值运算符
    String& operator=(const String& other) {
        if (this != &other) {
            delete[] data;  // 释放原有内存
            length = other.length;
            data = new char[length + 1];  // 重新分配内存
            strcpy(data, other.data);     // 复制数据
        }
        cout << "深拷贝赋值运算符被调用" << endl;
        return *this;
    }
    
    // 析构函数
    ~String() {
        delete[] data;
        cout << "析构函数被调用" << endl;
    }
    
    // 显示字符串
    void display() const {
        cout << "字符串内容: " << data << endl;
    }
    
    // 修改字符串
    void modify(const char* newStr) {
        strcpy(data, newStr);
    }
};

int main() {
    cout << "=== 深拷贝示例 ===" << endl;
    String s1("Hello");
    String s2 = s1;  // 调用深拷贝构造函数
    
    cout << "修改前:" << endl;
    s1.display();
    s2.display();
    
    s1.modify("World");
    cout << "修改s1后:" << endl;
    s1.display();
    s2.display();  // s2不会被修改，因为有自己的内存空间
    
    cout << "\n=== 深拷贝赋值示例 ===" << endl;
    String s3("Hello");
    String s4;
    s4 = s3;  // 调用深拷贝赋值运算符
    
    cout << "修改前:" << endl;
    s3.display();
    s4.display();
    
    s3.modify("World");
    cout << "修改s3后:" << endl;
    s3.display();
    s4.display();  // s4不会被修改，因为有自己的内存空间
    
    return 0;
}
