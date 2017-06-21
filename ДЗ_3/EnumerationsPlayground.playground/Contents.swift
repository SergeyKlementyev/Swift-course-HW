//: Playground - noun: a place where people can play

import UIKit

//Создать enum дни недели, предусмотреть функцию возвращающая стринговое представление случая и целочисленное; 1 балл
enum WeekDay {
    case monday, tuesday, wednesday, thursday,
            friday, saturday, sunday
}

func getIntStrByWeekDay(_ weekDay: WeekDay) -> (Int,String) {
    switch weekDay {
    case .monday:
        return (1,"monday")
    case .tuesday:
        return (2,"tuesday")
    case .wednesday:
        return (3,"wednesday")
    case .thursday:
        return (4,"thursday")
    case .friday:
        return (5,"friday")
    case .saturday:
        return (6,"saturday")
    case .sunday:
        return (7,"sunday")
    }
}

let (dayInt,dayString) = getIntStrByWeekDay(WeekDay.monday)
print(dayInt,dayString)

//Создать ассоциативный enum NetworkType, где есть элементы wifi(name: String), 3g (distance: Double), 4g(distance: Double, code: Int), none. Создать функцию принимающую данный тип и которая выводит, если это wifi “wifi - name”, 3g - “3g  - distance”, 4g - “4g - distacne, code”, none - “none”; 1 балл
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}


enum NetworkType {
    case wifi(String)
    case _3g(distance: Double)
    case _4g(distance: Double, code: Int)
    case none
}

func printNetworkType(_ networkType: NetworkType) {
    switch networkType {
    case .wifi(let name):
        print("wifi - \(name)")
    case ._3g(let distance):
        print("3g - \(distance)")
    case ._4g(let distance, let code):
        print("4g - \(distance), \(code)")
    case .none:
        print("none")
    }
}
printNetworkType(NetworkType._4g(distance: 123.0, code: 23))
