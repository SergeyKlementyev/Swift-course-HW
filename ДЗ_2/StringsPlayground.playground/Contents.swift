//: Playground - noun: a place where people can play

import UIKit


//1.Вывести на печать все символы строки в одну строку. 1 балл;
print("Задача 1")
let str = "Hello from California"

for character in str.characters {
    print(character, terminator:"")
}
print("\n---------------")
//2.Найти в массиве строку с наибольшей длиной и вывести ее. 1 балл;
print("Задача 2")
let names = ["Ilia","Katia","Tania","Margorita","Petia","samaiaDlinnaia"]
var maxLength = 0
var indexMaxLength = 0

for (index, value) in names.enumerated() {
    if value.characters.count > maxLength {
       maxLength = value.characters.count
        indexMaxLength = index
    }
}
print(names[indexMaxLength])
print("---------------")
//3.Дан массив строк [“[M] Alex”, “[M] John”, “[F] Anna”, “[M] David”, “[F] Victoria”, “[M] Smith”], посчитать сколько элементов содержать префикс “[M]”. 3 балла;
print("Задача 3")
let persons = ["[M] Alex", "[M] John", "[F] Anna", "[M] David", "[F] Victoria", "[M] Smith"]
var menCount = 0
for person in persons {
    if person.hasPrefix("[M]") {
        menCount += 1
    }
}
print(menCount)
print("---------------")
//4.Написать алгоритм определения палиндрома. 4 баллов;
print("Задача 4")

let polindrom = "abcdededcba" // Строка для проверка на полиндром
var IsPolindrom = true // Изначально полагаем, что строка полиндром

let middle = (polindrom.characters.count-1)/2 //кол-во итераций цикла

//Так как массив символьный, использование целочисленного индекса невозможно

var start = polindrom.startIndex
var end = polindrom.index(before: polindrom.endIndex)

for counter in 1...middle{
    if polindrom[start] != polindrom[end] {
        IsPolindrom = false
        break
    }
    
    start = polindrom.index(after: start)
    end = polindrom.index(before: end)
}
print("Строка полиндром: \(IsPolindrom)")
print("---------------")
//5.Проверить строку на уникальность символов. 3 балла;
print("Задача 5")
let str5 = "helloqweqe"
var letters = [Character: Int]()

for character in str5.characters {
    if let letter = letters[character]{
        letters[character] = letter + 1
    } else {
        letters[character] = 1
    }
}

for elem in letters {
    print(elem)
}
print("---------------")
//6.Вывести надпись “café” (с черточкой сверху) без копипаста символа “é”. Подсказка - использовать Unicode. 1 баллов;
print("Задача 6")
print("caf\u{E9}")
print("---------------")
//7.Дана строка, вывести все ее возможные перестановки. Для строки “abc” -> “abc”, “acb”, “bac”, “bca”, “cab”, “cba”. 6 баллов.\


