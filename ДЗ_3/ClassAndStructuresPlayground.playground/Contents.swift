//: Playground - noun: a place where people can play

//Создать класс Student, создать класс StudentGroup, которая содержит массив студентов Student, создать объект класса StudentGroup, заполнить его данными. В StudentGroup должны быть функции которые считают сред. арифм оценку группы, выводят лучших 3-х студентов, так же должны быть функции добавление и удаления студентов; 2 балла

class Student {
    var name: String
    var avgMark: Double
    init(_ name: String,_ avgMark: Double) {
        self.name = name
        self.avgMark = avgMark
    }
}

class StudentGroup {
    var students = [Student]()
    
    func addStudent(student: Student) {
        students.append(student)
    }
    
    func removeStudent(studentName: String) {
        if let index = students.index(where: {$0.name == studentName}){
            students.remove(at: index)
        }
    }
    func getAvgGroupMark() -> Double {
        var sum = 0.0
        for student in students {
           sum+=student.avgMark
        }
        return sum/Double(students.count)
    }
    func printThreeBests()  {
        let sortedByAvgMark = students.sorted(by: {$0.avgMark > $1.avgMark})
        guard sortedByAvgMark.count >= 3 else {
            return
        }
        for stud in sortedByAvgMark[0..<3] {
            print(stud.name, terminator: " ")
        }
        print()
    }
}

var myGroup = StudentGroup()
myGroup.addStudent(student: Student("Vasia", 1))
myGroup.addStudent(student: Student("Petia", 2))
myGroup.addStudent(student: Student("Dima", 3))
myGroup.addStudent(student: Student("Alena", 1))
myGroup.printThreeBests()
print("avg group mark is \(myGroup.getAvgGroupMark())")
print("----------")
//Написать сравнение Class и Struct. В каких случаях нужно применять то, в каком другое; 2 балла

/* Сходства :
   1) Используют свойства для хранения значений
   2) Используют методы для добавления функциональности
   3) могут иметь subscript syntax 
   4) Могут имерь расширения (extends)
   5) Соответствуют протоколам
 
    Отличия :
   1) Класс - reference type                Structure и Enumerations - value type
   2) Для классов есть наследование 
   3) type casting для классов
   4) Классы  могут иметь деинициализаторы
   5) Memberwise Initializers for Structure Types , у классов нету
   6) По дефолту свойства структуры нельзя изменять в методе экземпляра.(mutating)
 
   Применение: 
 Структуры - основное назначение - связать простые типы родственных значений
   1) ожидается что экземпляры будут копироваться, а не передаваться по ссылке - структура
   2) все свойсива экзмемпляров тоже value type - структура
   3) нет необходимости наследования - структура
 
 Для классов характеры обратные черты
 Основный признак использования классов : экземпляры должны передаваться по ссылке
*/
//Есть структура Point, Circle. Добавить computed property radius к Circle. 1 балл
struct Point {
    var x = 0.0, y = 0.0
}
struct Circle {
    var centre = Point()
    var diameter = Double()
    var radius: Double {
        get {
            return diameter / 2.0
        }
        set(newRadius){
            diameter = newRadius * 2.0
        }
    }
}

//Создать структуру Point, Vector. В структуре Vector создать методы сложения и вычитания вектора, добавить метод поворота вектора на сколько градусов. 3 балла
import Darwin
struct Vector {
    var point = Point()
    
    mutating func addVector(vector: Vector) {
        point.x = point.x + vector.point.x
        point.y = point.y + vector.point.y
    }
    
    mutating func subtractVector(vector: Vector) {
        point.x = point.x - vector.point.x
        point.y = point.y - vector.point.y
    }
    // повернуть на угол относительно вектора (1, 0)
    mutating func turnToDegree(_ deg: Double) {
        
        //функция перевода градусов в радианы
        func degToRad(_ degrees: Double) -> Double {
            return Double.pi * 2.0 * degrees / 360.0
        }
        
        let rad = degToRad(deg)
        // r - длина вектора
        let r = sqrt(point.x*point.x+point.y*point.y)
        let y = r * sin(rad)
        let x = r * cos(rad)
        point.x = round(100 * x) / 100
        point.y = round(100 * y) / 100
    }
}

var myVector = Vector(point: Point(x: 2,y: 2))
myVector.turnToDegree(0)
print(myVector.point.x, myVector.point.y)
myVector.turnToDegree(45)
print(myVector.point.x, myVector.point.y)
myVector.turnToDegree(360)
print(myVector.point.x, myVector.point.y)
myVector.turnToDegree(450)
print(myVector.point.x, myVector.point.y)

print("----------")

//Создать класс Wallet, который содержит баланс, статус кошелька  (enable, disable, blocked). Сам класс Wallet имеет свойство версия кошелька и 2 функции заблокировать и разблокировать кошелек, который передается в качестве параметра. Класс умеет добавлять или вычитать средства из кошелька. 2 балла
class Wallet {
    var balance = 0.0
    var status = walletStatus.enable
    
    enum walletStatus {
        case enable
        case disable
        case blocked
    }
    
    static var walletVersion = Double()
    
    class func blockWallet(wallet: Wallet) {
        wallet.status = .blocked
    }
    
    class func unblockWallet(wallet: Wallet) {
        wallet.status = .enable
    }
    
    class func addCash(wallet: Wallet, amount: Double) {
        guard wallet.status == .enable else {
            print("Sorry, wallet isn't enabled")
            return
        }
        wallet.balance+=amount
    }
    
    class func subtractCash(wallet: Wallet, amount: Double) {
        guard wallet.status == .enable else {
            print("Sorry, wallet isn't enabled")
            return
        }
        guard wallet.balance > amount else {
          print("Not enough money")
          return
        }
        wallet.balance-=amount

    }
}

var myWallet = Wallet()
print(myWallet.balance)
Wallet.addCash(wallet: myWallet, amount: 12.23)
Wallet.subtractCash(wallet: myWallet, amount: 13)
Wallet.subtractCash(wallet: myWallet, amount: 12)
print(myWallet.balance)
//Создать иерархию классов Vehicle, Car, MotorCycle, ElectroCar. Vehicle содержит свойства currentSpeed, maxSpeed, weight, model, mileage (пробег) и методы blowOut(выброс газа), signal. blowOut возвращает Double, который представляет собой кол-во газа выброшенного трансп. средством и определяется по усредненной формуле weight * 0.001 * mileage. Метод signal() делает звуковой сигнал. Реализовать классы Car, MotorCycle, ElectroCar, таким образом, что в Car добавляется новое свойство цвет машины и метод определяющий выброс как weight * 0.003 * mileage. В MotorCycle добавить тип мотоцикла (chopper, sport, scooter, russianShit) и метод определяющий выброс как если это russianShit то weight * 0.1 * mileage, если другой тип, то оставить без изменения. ElectroCar такой же объект как и Car, только метод определения выброса возвращает 0. Для всех классов определить метод signal. 3 балла
class Vehicle {
    var currentSpeed = 0.0
    var maxSpeed: Double
    var weight: Double
    var model: String
    var mileage = 0.0     // пробег
    
    init(currentSpeed: Double, maxSpeed: Double, weight: Double, model: String, mileage: Double ) {
        self.currentSpeed = currentSpeed
        self.maxSpeed = maxSpeed
        self.weight = weight
        self.model = model
        self.mileage = mileage
    }
    
    convenience init(maxSpeed: Double, weight: Double, model: String){
        self.init(currentSpeed: 0.0, maxSpeed: maxSpeed, weight: weight, model: model, mileage: 0.0)
    }
    
    func blowOut() -> Double {
        return weight * 0.001 * mileage
    }
    func signal()  {
        print("signal like a vehice")
    }
}

class Car: Vehicle {
    var color: String
    init(currentSpeed: Double, maxSpeed: Double, weight: Double, model: String, mileage: Double, color: String)  {
        self.color = color
        super.init(currentSpeed: currentSpeed, maxSpeed: maxSpeed, weight: weight, model: model, mileage: mileage)
    }
    override func blowOut() -> Double {
        return weight * 0.003 * mileage
    }
    override func signal() {
        print("signal like a car")
    }
}


class ElectroCar: Car {
    override func blowOut() -> Double {
        return 0
    }
}

enum motorCycleType {
    case chopper
    case sport
    case scooter
    case russianShit
}

class MotorCycle: Vehicle {
    var type = motorCycleType.chopper
    
    init(currentSpeed: Double, maxSpeed: Double, weight: Double, model: String, mileage: Double, type: motorCycleType)  {
        super.init(currentSpeed: currentSpeed, maxSpeed: maxSpeed, weight: weight, model: model, mileage: mileage)
        self.type = type
    }
    
    override func blowOut() -> Double {
        if type == motorCycleType.russianShit {
            return weight*0.1*mileage
        }
        else {
            return super.blowOut()
        }
    }
    override func signal() {
        print("signal like a motorcycle")
    }
}


