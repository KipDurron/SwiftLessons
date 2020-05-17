import UIKit


/// #1 Решить квадратное уравнение.
let a:Float = 1
let b:Float = 20
let c:Float = 3
var desc:Float
var x_1, x_2:Float
desc = b * b - 4 * a * c
if a != 0 && b != 0 && c != 0 {
    if desc > 0 {
        x_1 = ((-1) * b + desc.squareRoot() ) / (2 * a)
       x_2 = ((-1) * b - desc.squareRoot() ) / (2 * a)
    }
    if desc == 0 {
        x_1 = (-1) * b / (2 * a)
    }
}
if a != 0 && b != 0 && c == 0 {
    x_1 = 0
    x_2 = (-1) * b / a
}
if a != 0 && b == 0 && c != 0 {
    if c > 0 {
 x_1 = ((-1) * b + desc.squareRoot() ) / (2 * a)
x_2 = ((-1) * b - desc.squareRoot() ) / (2 * a)
    }

}
if a != 0 && b == 0 && c == 0 {
    x_1 = 0
}
/////////////////////////////////////////////////////////////////
//#2 Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let catet_1:Float = 2
let catet_2:Float = 3
let gepotenuza = (catet_1.squareRoot() + catet_2.squareRoot()).squareRoot()
let perimetr = catet_1 + catet_2 + gepotenuza
let plochad = 0.5 * catet_2 * catet_1
/////////////////////////// 
//#3 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
let sum:String? = readLine()
let procent:String? = readLine()
if let const_sum = sum, let const_procent = procent {
    if var float_sum = Float(const_sum), var float_procent = Float(const_procent) {
       for item in 1...5 {
             float_sum += float_sum * float_procent / 100
        }
        print(float_sum)
    }
    else{
        print("введено не число")
    }
} else {
    print("Введите значения для суммы и процента")
}

