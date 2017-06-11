//: Playground - noun: a place where people can play

import UIKit

//
//Заполнить массив случайными числами, рассчитать среднеарифметическое. 2 балла.
//

print("Задача 1")

//Инициализация и заполнение массива 

var intArray = [Int]()
for index in 1...10 {
    intArray += [Int(arc4random_uniform(10)+1)+10] }  // добавить случайное число 11...20
print(intArray)

//Расчет среднего арифметического

var sum = 0
for value in intArray {
    sum += value
}

let arithmeticAverage = Double(sum)/Double(intArray.count)

print(arithmeticAverage)
print("---------------------")

//
//Массив заполнен именами студентов, убрать дубликаты, отсортировать массив по длине строк и вывести первых 3-х студентов. 2 балла.
//

print("Задача 2")
var studNames = ["Katia", "Grisha", "Egor", "Andrei", "Ia", "Sviatoslav", "Ia", "Ia"]

//Cортировка

studNames.sort {
    $0.characters.count < $1.characters.count
}

//Убираем дубликаты. Запишем неповторяющиеся эл-ты в новый массив

var length = studNames.count
print(studNames)
var studNamesNew = [String]()
//Учитываем, что массив уже отсортирован...
for index in 0..<studNames.count-1 {
    if studNames[index] != studNames[index+1]{
        studNamesNew.append(studNames[index])
    }
}

//Вывести первые три элемента

for index in 0...2 {
    print(studNamesNew[index], terminator: " ")
}
print("\n---------------------")


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


