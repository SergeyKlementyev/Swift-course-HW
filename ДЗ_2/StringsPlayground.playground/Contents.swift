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

let str4 = "abcdededcba" // Строка для проверка на полиндром
let reverseStr4 = String(str4.characters.reversed())
print(str4 == reverseStr4 ? "polindrom": "not polindrom" )
print("---------------")



//5.Проверить строку на уникальность символов. 3 балла;
print("Задача 5")
let str5 = "helowq"

let numberOfDistinctChars = Set(str5.characters).count

print(str5.characters.count == numberOfDistinctChars ? "all characters are unique" : "not all characters are unique " )


print("---------------")
//6.Вывести надпись “café” (с черточкой сверху) без копипаста символа “é”. Подсказка - использовать Unicode. 1 баллов;
print("Задача 6")
print("caf\u{E9}")
print("---------------")
//7.Дана строка, вывести все ее возможные перестановки. Для строки “abc” -> “abc”, “acb”, “bac”, “bca”, “cab”, “cba”. 6 баллов.\

func permutations(_ n: Int,  _ a: inout Array<Character>) {
    if n == 1 {
        print(a)
        return
    }
    for i in 0..<n-1 {
        permutations(n-1,&a)
        swap(&a[n-1], &a[(n%2 == 1) ? 0 : i])
    }
    permutations(n-1,&a)
}

let str7 = "abc"
var arr = Array(str7.characters)
permutations(arr.count,&arr)

