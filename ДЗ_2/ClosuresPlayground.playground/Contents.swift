//: Playground - noun: a place where people can play

import UIKit

//
//Отсортировать массив строк. Но сортировку произвести не с первых символов, а с последних.  4 балла;
//

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let sortedNames = names.sorted() { (s1: String,s2: String) -> Bool in
    let reversedS1 = String(s1.characters.reversed())
    let reversedS2 = String(s2.characters.reversed())
    return reversedS1 < reversedS2
}
print(sortedNames)

//
//Из массива [“12”, “34”, “-76”, “0”, “5”] получить массив типа Int. И оставить только положительные числа. 3 балла;
//
let strArray = ["12", "34", "-76", "0", "5"]
let intArray = strArray.flatMap {
    return Int($0)
}
let filteredIntArray = intArray.filter {
    $0>0
}
print(filteredIntArray)



//

