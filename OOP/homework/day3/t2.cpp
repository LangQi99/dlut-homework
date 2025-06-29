#include <iostream>
using namespace std;

class Stack {
private:
    int* arr;
    const int capacity;
    int top;
    int sum;
    static int total;
public:
    Stack(int size) : capacity(size), top(-1), sum(0) {
        arr = new int[capacity];
    }
    Stack(const Stack& other) : capacity(other.capacity), top(other.top), sum(other.sum) {
        arr = new int[capacity];
        for (int i = 0; i <= top; ++i) {
            arr[i] = other.arr[i];
        }
        total += sum;
    }
    ~Stack() {
        total -= sum;
        delete[] arr;
    }
    bool push(int value) {
        if (isFull()) return false;
        arr[++top] = value;
        sum += value;
        total += value;
        return true;
    }
    bool pop() {
        if (isEmpty()) return false;
        sum -= arr[top];
        total -= arr[top--];
        return true;
    }
    int peek() const {
        if (isEmpty()) {
            cout << "Stack is empty!" << endl;
            return -1;
        }
        return arr[top];
    }
    bool isFull() const { return top == capacity - 1; }
    bool isEmpty() const { return top == -1; }
    static int getTotal() { return total; }
};
int Stack::total = 0;

int main() {
    Stack original(5);
    original.push(10);
    original.push(20);
    original.push(30);
    cout << "Original stack:" << endl;
    cout << "Top element: " << original.peek() << endl;
    cout << "Total elements: " << Stack::getTotal() << endl;

    Stack copy(original);
    cout << "\nCopied stack:" << endl;
    cout << "Total elements: " << Stack::getTotal() << endl;

    copy.pop();
    copy.push(40);

    cout << "\nAfter modifications:" << endl;
    cout << "Original top: " << original.peek() << endl;
    cout << "Copy top: " << copy.peek() << endl;
    cout << "Total elements: " << Stack::getTotal() << endl;
    return 0;
} 