#include <iostream>
#include <cstring>
using namespace std;

class MyString {
public:
    MyString(const char *str = NULL) {
        if (str) {
            m_data = new char[strlen(str) + 1];
            strcpy(m_data, str);
        } else {
            m_data = new char[1];
            m_data[0] = '\0';
        }
    }
    MyString(const MyString &other) {
        m_data = new char[strlen(other.m_data) + 1];
        strcpy(m_data, other.m_data);
    }
    ~MyString() {
        cout << "delete " << m_data << endl;
        delete[] m_data;
    }
    void set(char *str) {
        delete[] m_data;
        m_data = new char[strlen(str) + 1];
        strcpy(m_data, str);
    }
    MyString& append(const MyString &other) {
        char *new_data = new char[strlen(m_data) + strlen(other.m_data) + 1];
        strcpy(new_data, m_data);
        strcat(new_data, other.m_data);
        delete[] m_data;
        m_data = new_data;
        return *this;
    }
    void print() {
        cout << m_data << endl;
    }
private:
    char *m_data;
};

int main() {
    MyString str1("Hello, ");
    str1.print();
    MyString str2(str1);
    str2.set((char*)"World!");
    str2.print();
    str1.append(str2).print();
    return 0;
} 