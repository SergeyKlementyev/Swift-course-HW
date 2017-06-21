//: Playground - noun: a place where people can play

import UIKit

//
//Заполнить массив случайными числами, рассчитать среднеарифметическое. 2 балла.
//

print("Задача 1")

//Инициализация и заполнение массива 

let randomArray = (1...100).map{_ in Int(arc4random())%100}
print(randomArray)

//Расчет среднего арифметического
let sum = randomArray.reduce(0, +)
let arithmeticAverage = Double(sum)/Double(randomArray.count)

print(arithmeticAverage)
print("---------------------")

//
//Массив заполнен именами студентов, убрать дубликаты, отсортировать массив по длине строк и вывести первых 3-х студентов. 2 балла.
//

print("Задача 2")
var studNames = ["Katia", "Grisha", "Egor", "Andrei", "Ia", "Sviatoslav", "Ia", "Ia"]

//Убираем дубликаты.

let studNamesSet = Set(studNames)
studNames = Array(studNamesSet)

//Cортировка

studNames.sort {
    $0.characters.count < $1.characters.count
}

//Вывести первые три элемента

print (studNames[0..<3])


//Есть множество городов, на путевки в которые у пользователя есть деньги, так же есть множество городов, которые нравятся пользователю, но не факт, что у него есть деньги на путевку, и еще есть множество городов, в которые въезд запрещен в связи с санкциями. Определить множество городов, в которые может поехать пользователь. 3 балла.
print("Задача 3")
let enoughMoneyCities: Set = ["Samara", "Sochi", "Simpheropl", "Arhangelsk", "Ufa", "Kiev", "Odessa"] // на них есть деньги
let likedCities: Set = ["Sochi", "Simpheropl", "NewYork", "London", "Barselona", "Kiev"] // нравятся, но может не хватить денег
let banedCities: Set = ["Kiev", "Odessa"] //въезд запрещен

let availableCities = likedCities.intersection(enoughMoneyCities).subtracting(banedCities)

print(availableCities)

print("---------------------")
//Пользователь ведет телефонную книгу, где фамилии абонента соответствует телефонный номер. Пользователь хочет позвонить другу, но помнит только первые 3 буквы фамилии “Пут”. Если в его записной книжке оказался только один такой номер, то вывести номер на экран, если несколько, то вывести первый, если ни одного, то вывести “not found”. 3 балла.
print("Задача 4")
let phoneBook: [String: String] = ["Kurochkin": "2233","Kuropatkin": "5544","Kuricin": "2365","Milashkina": "6564"]

let findString = "Kur"
var isFind = false

for (name,number) in phoneBook {
    if name.hasPrefix(findString){
        print("\(name) \(number)")
        isFind = true
        break
    }
}

if isFind == false {
    print("not found")
}


