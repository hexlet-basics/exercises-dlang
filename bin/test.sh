dmd main.d 2>&1
g++ -std=c++17 -o test_runner.out test.cpp -lm 2>&1
./test_runner.out
