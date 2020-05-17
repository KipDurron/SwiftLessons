import UIKit

//1. Написать функцию, которая определяет, четное число или нет.
func isEven(testNumber number: Float) -> Bool {
    return number.truncatingRemainder(dividingBy: 2) == 0
}
print(isEven(testNumber: 3))
//2.Написать функцию, которая определяет, делится ли число без остатка на 3.
func delOnThree(testNumber number: Float) -> Bool {
    return number.truncatingRemainder(dividingBy: 3) == 0
}
print(delOnThree(testNumber: 34))
//3. Создать возрастающий массив из 100 чисел.
func createArray(valueOfArray value: Int) -> Array<Float> {
    var array: [Float] = []
    for i in 0...value - 1 {
        array.append(Float(i))
    }
    return array
}
var array = createArray(valueOfArray: 100)
print(array)
//4.Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func delFromArray(fromArray array: inout Array<Float>) {
    for (_, value) in array.enumerated() {
        if (isEven(testNumber: value) || delOnThree(testNumber: value)) {
            array.remove(at: array.firstIndex(of: value)!)
        }
    }
}
delFromArray(fromArray: &array)
print(array)
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func fibonacci(Number number: Int) -> Float {
    if number == 1 || number == 2 {
        return 1
    } else {
        return fibonacci(Number: number - 1) + fibonacci(Number: number - 2)
    }
}
func addToArrFibNumber(toArray arr: inout Array<Float>) {
    if arr.isEmpty {
        arr.append(1)
    } else {
        let NewlastNumber = arr.endIndex + 1
        arr.append(fibonacci(Number: NewlastNumber))
    }
}
var arrFib: [Float] = []
for _ in 1...10 {
    addToArrFibNumber(toArray: &arrFib)
}
print(arrFib)
