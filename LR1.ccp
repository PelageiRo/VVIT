#include<iostream>
#include<math.h>

class Polynomial { //Объявление класса
private:  //объявление переменных - приватных
    int a;
    int b;
    int c;
    double x1;
    double x2;
public:
    Polynomial(int x, int y, int z) :a(x), b(y), c(z) {};
    int korni() {
        double D;
        if (this->b % 2 == 0) {
            D = pow((this->b / 2), 2) - (this->a) * (this->c);
            if (D < 0) {
                std::cerr << "Дискриминант <0";
                return -1;
            }
            x1 = (((-1) * this->b / 2) + sqrt(D)) / this->a;
            x2 = (((-1) * this->b / 2) - sqrt(D)) / this->a;
        }
        else {
            D = (double)((double)(this->b) * (double)(this->b) - 4 * ((double)this->a * (double)this->c));
            if (D < 0) {
                std::cerr << "Дискриминант <0";
                return -1;
            }
            x1 = (((-1) * this->b / 2) + sqrt(D)) / 2 * this->a;
            x2 = (((-1) * this->b / 2) - sqrt(D)) / 2 * this->a;
        }
        return 0;
    }
    double Get_x1() {
        return x1;
    }
    double Get_x2() {
        return x2;
    }
};

int main() {
    setlocale(LC_ALL, "rus");
    std::cout << "Введите через пробел коэффициенты квадратного уравнения(a b c)" << std::endl;
    int a; int c; int b;
    if (!(std::cin >> a >> b >> c)) {
        std::cerr << "Error cin";
        return -2;
    }
    Polynomial objj1(a, b, c); //Создаём объект класса Polynomial 
    objj1.korni();  // Вызываем функцию вычисляющую корни, она определена в классе смотреть выше
    std::cout << "x1=" << objj1.Get_x1() << "\t" << "x2=" << objj1.Get_x2()<<"\n"; // Вывод значений посредством вызова функций класса который возвращают значения корней
    return 0;
}
