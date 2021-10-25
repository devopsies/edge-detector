#include <iostream>
using namespace std;

#define inf 99999

int main(int argc, char **args){
    int prev = inf, cur;
    while(cin >> cur){
        if (prev == inf){
            cout << "0";
            prev = cur;
            continue;
        }
        if (abs(prev - cur) > 10){
            cout << " 1";
        }else{
            cout << " 0";
        }
        prev = cur;
        if (cin.peek() == '\n') break;
    }
    cout << '\n';
    exit(0);
}