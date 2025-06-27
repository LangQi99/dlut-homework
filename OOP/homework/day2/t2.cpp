#include <iostream>
using namespace std;
class Rational {
    int n, m;
    void simple() {
        int a = m < 0 ? -m : m, b = n < 0 ? -n : n, t;
        while (b) { t = a % b; a = b; b = t; }
        if (a) { n /= a; m /= a; }
        if (m < 0) { n = -n; m = -m; }
    }
public:
    Rational(int nn=1, int mm=1) { n = nn; m = mm; simple(); }
    Rational R_add(Rational &A) { return Rational(n*A.m + A.n*m, m*A.m); }
    Rational R_sub(Rational &A) { return Rational(n*A.m - A.n*m, m*A.m); }
    Rational R_mul(Rational &A) { return Rational(n*A.n, m*A.m); }
    Rational R_div(Rational &A) { return Rational(n*A.m, m*A.n); }
    void print() { cout << n << "/" << m << endl; }
};
int main() {
    Rational a(2,4), b(3,9);
    a.R_add(b).print();
    a.R_sub(b).print();
    a.R_mul(b).print();
    a.R_div(b).print();
    return 0;
} 