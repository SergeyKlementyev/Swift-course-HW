//: Playground - noun: a place where people can play

import UIKit

//Создать класс Book (книга), у которого есть два свойства автор и название, создать иницилайзер для этих двух свойств, добавить свойство год издания и создать иницилайзер для трех свойств. Создать класс Magazine(журнал) у которого есть дополнительное свойство издание. Создать класс FashionMagazine у которого есть дополнительное свойство рейтинг. Построить иерархию классов, также у каждого класса завести иницилайзеры. Добавить через расширение функцию, возвращающая полное наименование ( автор + название + год издание). 2 балла
class Book {
    var author: String
    var title: String
    var publicationYear: Int?
    init(author: String, title: String) {
        self.author = author
        self.title = title
    }
    
    init(author: String, title: String, publicationYear: Int) {
        self.author = author
        self.title = title
        self.publicationYear = publicationYear
    }
}

class Magazine: Book {
    var edition: String  //издание
    
    init(author: String, title: String, edition: String) {
        self.edition = edition
        super.init(author: author, title: title)
    }
    
    init(author: String, title: String, publicationYear: Int, edition: String) {
        self.edition = edition
        super.init(author: author, title: title, publicationYear: publicationYear)
    }
}

class FashionMagazine: Magazine {
    var rating: Int
    init(author: String, title: String, edition: String, rating: Int) {
        self.rating = rating
        super.init(author: author, title: title, edition: edition)
    }
    
    init(author: String, title: String, publicationYear: Int, edition: String, rating: Int) {
        self.rating = rating
        super.init(author: author, title: title, publicationYear: publicationYear, edition: edition)
    }
}

extension Book {
    var fullName: String {
        if let year = self.publicationYear {
        return self.author+" "+self.title+" "+String(year)
        } else {
            return self.author+" "+self.title
        }
    }
}

let newCoolMagazine = FashionMagazine(author: "Sergey", title: "PRIvet", edition: "25 (april)", rating: 234)
print(newCoolMagazine.fullName)
print("------------")
//Создать структуру Point, со свойствами x,y. Реализовать следование Point протоколу Comparable. (3 балла)
struct Point: Comparable{
    var x = 0.0
    var y = 0.0
    static func <(p1: Point,p2: Point) -> Bool {
        return (p1.x + p1.y < p2.x + p2.y) ? true : false
    }
    static func ==(p1: Point,p2: Point) -> Bool {
        return (p1.x == p2.x && p1.y == p2.y) ? true : false
    }
}
let a = Point(x: 2,y: 3)
let c = Point(x: 1,y: 1)
let b = Point(x: 2,y: 3)
print(a==b)
print(a>c)
print("------------")
//Добавить вычисляемое property “average” к классу Point, которое будет зеркальным относительно центра координат. Добавить через расширение. ( 1 балл)


extension Point {
    var avarage: Point {
        set(p) {
            x = -p.x
            y = -p.y
        }
        get {
            return Point(x: -x,y: -y)
        }
    }
}

var p = Point(x: 3, y: -4)
p.avarage = p
print(p.avarage)
print("------------")
//Создать функцию, которая принимает аргумент типа Areable(площадь). Areable протокол с функцией area() возвращающая Double - площадь фигуры. По умолчанию функция должна возвращать 0. Реализовать три класса Triangle, Rectangle, Square которые следуют этому протоколу. (2 балла)
protocol Areable {
    func area() -> Double
}

extension Areable {
    func area() -> Double {
        return 0
    }
}

class Triangle: Areable {
    var a: Double
    var b: Double
    var c: Double
    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    func area() -> Double {
        let p = (a + b + c) / 2.0
        return sqrt(p * (p - a) * (p - b) * (p - c))
    }
}

class Rectangle: Areable {
    var a: Double
    var b: Double
    init(a: Double, b: Double) {
        self.a = a
        self.b = b
    }
    func area() -> Double {
        return a * b
    }
}

class Square: Areable {
    var a: Double
    init(a: Double) {
        self.a = a
    }
    func area() -> Double {
        return a * a
    }
}

var rect = Rectangle(a: 2, b: 4)
print(rect.area())
print("------------")
//Реализовать паттерн делегирование. Есть класс Professor. Есть классы Student, Schoolboy. Профессору на урок нужен мел, ему не важно кто за ним побежит школьник или студент, главное чтобы за мелом кто-то сбегал. Как это должно выглядеть: у профессора есть свойство delegate, делегат это протокол ErrandBoy ( мальчик на побегушках). Этот протокол содержит одну функцию goToChalk(). ( 3 балла)
protocol ErrandBoy {
    func goToChalk()
}
class Professor {
    var delegate: ErrandBoy?
    func needChalk(){
        if delegate?.goToChalk() == nil {
            print("need delegate: ErrandBoy")
        }
    }
}

class Student: ErrandBoy {
    func goToChalk() {
        print("stud is running")
    }
}

class SchoolBoy: ErrandBoy {
    func goToChalk() {
        print("schoolBoy is runing")
    }
}

var prof = Professor()
prof.needChalk()
prof.delegate = Student()
prof.needChalk()
prof.delegate =  SchoolBoy()
prof.needChalk()
print("------------")
//Реализовать дженерик контейнер FIFO (первый зашел, первый вышел). По аналогии с Stack из книжки эпла. ( 6 баллов )

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    func isEmpty() -> Bool
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct Queue<Element>: Container{
    var items = [Element]()
    mutating func append(_ item: Element) {
        items.append(item)
    }
    mutating func dequeue() -> Element {
        return items.removeFirst()
    }
    func peek() -> Element {
        return items[0]
    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

var queue = Queue<String>()
queue.append("Where")
queue.append("123")
queue.append("is")
queue.append("the")
queue.append("river")
print(queue.count)
print(queue.isEmpty())
print(queue.peek())
while queue.isEmpty() != true {
    print(queue.dequeue()+" ", terminator: " ")
}
print("")