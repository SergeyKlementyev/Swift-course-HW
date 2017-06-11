//: Playground - noun: a place where people can play

import UIKit
//
//Посчитать факториал числа. 2 балла.
//
print("Задача 1")
func factorial(_ n: Int) -> Int {
    var result = 1
    for number in 2...n {
        result*=number
    }
    return result
}
print(factorial(5))
print("--------------")
//
//Передать в функцию целочисленный массив. Вернуть максимальное и минимальное значение. 3 балла;
//
print("Задача 2")
let intArr = [2,5,6,4,88,5,33,64,23,123,56,-2,3]
func maxMinValue(_ intArr: [Int]) -> (min: Int, max: Int)? {
    guard intArr.count > 0 else {
        return nil
    }
    var currentMin = intArr[0]
    var currentMax = intArr[0]
    for value in intArr [1..<intArr.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

if let bounds = maxMinValue(intArr) {
    print("min is \(bounds.min), max is \(bounds.max)")
}
print("--------------")
//
//Есть две функции для логирования, одна выводит переданный в нее текст капсом, другая нет. Есть другая функция, которая возвращает одну из этих функций, в зависимости от того, если переданный текст содержит воскл. знак. Написать эти функции. 3 балла;
//
print("Задача 3")

let str = "One Two Three!"

func getLogFunction(_ text: String) -> (String) -> () {
    func capsLogFunction(_ text: String) {
        print(text.uppercased())
    }
    func noCapsLogFunction(_ text: String) {
        print(text)
    }
    for char in text.characters {
        if char == "!" {
            return capsLogFunction(_:)
        }
    }
    return noCapsLogFunction(_:)
}
let logFunction = getLogFunction(str)
logFunction(str)
print("--------------")
