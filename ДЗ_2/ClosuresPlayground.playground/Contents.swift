//: Playground - noun: a place where people can play

import UIKit

//
//Отсортировать массив строк. Но сортировку произвести не с первых символов, а с последних.  4 балла;
//

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let sortedNames = names.sorted() { (s1: String,s2: String) -> Bool in
    var reversedS1 = String() // s1 перевернутая
    var reversedS2 = String() // s2 перевернутая
    var currentIndex = s1.endIndex
    for counter in 0..<s1.characters.count {
        currentIndex = s1.index(before: currentIndex)
        reversedS1.append(s1[currentIndex])
    }
    
    // То же самое для s2
    currentIndex = s2.endIndex
    for counter in 0..<s2.characters.count {
        currentIndex = s2.index(before: currentIndex)
        reversedS2.append(s2[currentIndex])
    }
    
    
    return reversedS1 < reversedS2
}
print(sortedNames)

//
//Из массива [“12”, “34”, “-76”, “0”, “5”] получить массив типа Int. И оставить только положительные числа. 3 балла;
//
let array = ["12", "34", "-76", "0", "5"]
var intNumbers = array.map {
    (str) -> Int in
    var number = Int(str)
    return number ?? 0
}

func filterArray(array: [Int], f: (Int) -> Bool) -> [Int] {
    var filtered = [Int]()
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}

let positiveInts = filterArray(array: intNumbers, f: {
    $0>0
})

print(positiveInts)


//

