//: Playground - noun: a place where people can play

import UIKit

// Площадь и периметр

let a = 4.0, b = 5.0, c = 6.0  // Длины сторон треугольника

let perimeter = a + b + c // Периметр треугольника

let p = perimeter/2; // Полупериметр
let area = sqrt((p*(p-a)*(p-b)*(p-c))) // Вычисление площади ( по трем сторонам)

print("area = \(area) \nperimeter = \(perimeter)")


//
//Даны 2 целочисленные переменные, нужно поменять их местами, не используя дополнительных переменных. 1 балл;
//
var a1 = 10
var a2 = 1
a2 = a2 + a1
a1 = a2 - a1
a2 = a2 - a1
print("a1 = \(a1)  a2 = \(a2) ")

//
//Ввести число, если введено четное число, то вывести “Even”, нет - “Odd”. 1 балл;
//

let number = 12
if number % 2 == 0{
    print("Even")
}
else {
    print("Odd")
}
//
let out = (number % 2 == 0 ? "Even" : "Odd" )
print(out)

//
//Дана переменная var str: String?. Нужно вывести на экран str, но str не должен быть nil, если str nil, то записать в него значение “Default”. 1 балл;
//

var str: String?
str = str ?? "Def"
if let a = str {
    print(a)
}

// * Проверить находится ли введенное число в заданном диапазоне (Range/CountableRange), решение должно быть в одну строчку. (Подсказка: посмотреть на операторы работы с диапазонами) 4 балла;
//
let number2 = 100;
print(0..<200 ~= number2)
