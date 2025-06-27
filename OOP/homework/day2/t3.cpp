#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>
using namespace std;
class User {
    string id, pwd;
    string randstr(int n, bool isnum) {
        string s;
        for (int i = 0; i < n; i++) {
            if (isnum) s += '0' + rand() % 10;
            else s += 'A' + rand() % 26;
        }
        return s;
    }
public:
    User(string i) { id = i; pwd = randstr(6, 1); }
    ~User() { cout << "User析构" << endl; }
    void print() { cout << id << " " << pwd << endl; }
    string getpwd() { return pwd; }
    bool setpwd(string oldp, string newp) {
        if (oldp == pwd) { pwd = newp; cout << "修改成功" << endl; return true; }
        else { cout << "修改失败" << endl; return false; }
    }
};
int main() {
    srand(time(0));
    string id;
    cin >> id;
    User u(id);
    u.print();
    string oldp, newp;
    cin >> oldp >> newp;
    u.setpwd(oldp, newp);
    u.print();
    // 测试修改成功
    string realpwd = u.getpwd();
    string newpwd2 = "888888";
    u.setpwd(realpwd, newpwd2);
    u.print();
    return 0;
} 