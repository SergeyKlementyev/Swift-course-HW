//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Есть класс Person и класс CreditCard. Person содержит имя, возраст, массив CreditCard. CreditCard содержит свойства баланс и владелец. Организовать эти классы. 2 балла
//По предыдущему заданию добавить к CreditCard свойство withdraw и обрабатывать ошибки посредством throw/catch. 1 балл


//Возможные ошибки
enum CreditCardError: Error {
    case cardNotExists(info: String) // карта не существует
    case amountOutOfStock(info: String) //Недостаточно средств на счету
    case cardNameAlreadyExists(info: String) // Имя карты уже занято
}

class Person {
    var name: String
    var age: Int
    var creditCards: Dictionary<String,CreditCard>
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
        self.creditCards = Dictionary<String,CreditCard>()
        }
    
    // Добавить новую кредитную карту
    func addCreditCard (cardName: String,balance: Double) throws {
        guard creditCards[cardName] == nil else  {
            throw CreditCardError.cardNameAlreadyExists(info: cardName)
        }
        let newCard = CreditCard(owner: self, balance: balance)
        creditCards[cardName] = newCard
    }
    
    // Внести средства на карту
    
    func depositTo(cardName: String, amount: Double) throws {
        
        if let userCard = creditCards[cardName] {
            userCard.deposit(amount: amount)
        }else {
            throw CreditCardError.cardNotExists(info: cardName+" "+String(amount))
        }
        
    }
    
    //Снять средства с карты
    
    func withdrawFrom(cardName: String, amount: Double) throws{
        if let userCard = creditCards[cardName] {
            try userCard.withdraw(amount: amount)
        }else {
            throw CreditCardError.cardNotExists(info: cardName)
        }
    }
    
    // Вывести информацию о всех имеющихся картах
    
    func printInfo() {
        print("-------------")
        print("\(name) credit cards")
        for (cardName, creditCard) in self.creditCards {
            print(cardName, creditCard.balance)
        }
        print("-------------")
    }
    
    
}

class CreditCard {
    var balance: Double
    var owner: Person
    init(owner: Person, balance: Double) {
        self.balance = balance
        self.owner = owner
    }
    
    // Снять средства с карты
    func withdraw(amount: Double) throws {
        guard balance >= amount  else {
            throw CreditCardError.amountOutOfStock(info:
                "you tried withdraw \(amount), but your balance = \(balance)")
        }
        balance -= amount
    }
    
    // Внести средства на карту
    func deposit(amount: Double) {
        balance += amount
    }
}

do {
    let person = Person(name: "Katia",age: 23)
    try person.addCreditCard(cardName: "myCard1", balance: 334)
    try person.addCreditCard(cardName: "myCard2", balance: 332)
    try person.addCreditCard(cardName: "myCard3", balance: 213123)
//    try person.addCreditCard(cardName: "myCard3", balance: 213123)
    person.printInfo()
    try person.depositTo(cardName: "myCard3", amount: 1000000)
    person.printInfo()
    try person.withdrawFrom(cardName: "myCard3", amount: 250000)
//    try person.withdrawFrom(cardName: "myCard", amount: 250000)
    try person.withdrawFrom(cardName: "myCard3", amount: 25000000)
    person.printInfo()
    
} catch CreditCardError.cardNotExists(let info) {
    print("cardNotExists about: \(info)")
} catch CreditCardError.amountOutOfStock(let info) {
    print("amountOutOfStock about: \(info)")
} catch CreditCardError.cardNameAlreadyExists(let info) {
    print("cardNameAlreadyExists about: \(info)")
}
