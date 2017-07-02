import UIKit
//Создать сущность банковский счет, который имеет свойства id, balance и у которого есть метод deposit и withdraw, причем в случае ошибки эти методы кидают ошибку. 1 балл
enum OperationError: Error {
    case depositError(info: String)
    case withdrowError(info: String)
}

class BankAccount {
    var id: Int
    var balance: Double = 0.0
    init(id: Int, balance: Double) {
        self.id = id
        self.balance = balance
    }
    func deposit(amount: Double) throws {
        guard amount>0 else {
            throw OperationError.depositError(info: "incorrect deposit amount")
        }
        balance += amount
    }
    func withdrow(amount: Double) throws{
        guard amount>0 else {
            throw OperationError.withdrowError(info: "incorrect withdrow amount")
        }
        guard balance >= amount else {
            throw OperationError.withdrowError(info: "not enough balance to withdrow")
        }
        balance -= amount
    }
}
//Есть два типа клиентов банка: физ лица и юр лица, у каждого лица есть свойства id и bankAccount ( банковский счет). Но физ лица содержат еще свойства имя, фамилия, дата рождения. А юр лица содержат имя и тип организации ( OOO или OAO). Организовать классы и добавить инициализаторы. 1 балл
protocol Transferable {
    var bankAccount: BankAccount {get set}
}

class Person: Transferable {
    let id: Int
    var bankAccount: BankAccount
    init(id: Int, initialBalance: Double) {
        self.id = id
        bankAccount = BankAccount(id: id, balance: initialBalance)
    }
}



// юр лицо
enum OrgType {
    case OAO
    case OOO
}
class LegalPerson: Person {
    var orgName: String
    var orgType: OrgType
    init(id: Int, initialBalance: Double, orgName: String, orgType: OrgType) {
        self.orgName = orgName
        self.orgType = orgType
        super.init(id: id, initialBalance: initialBalance)
    }
}
//физ лицо
class NaturalPerson: Person {
    var name: String
    var surname: String
    var birthdate: Date
    init(id: Int, initialBalance: Double, name: String, surname: String, birthdate: Date) {
        self.name = name
        self.surname = surname
        self.birthdate = birthdate
        super.init(id: id, initialBalance: initialBalance)
    }
}
//Есть сущность банк, у которого есть банковский счет и у банка есть одна функция transfer, ее назначение переводить средства от одного отправителя на счет другого. Отправителем может быть физ лицо, юр лицо, другой банк, какая-то другая организация. Семантика функции такая transfer ( Отправитель, кол-во денег, банковский счет). Реализовать эту сущность. 3 балла


class Bank: Transferable {
    var bankAccount: BankAccount
    init(id: Int, initialBalance: Double) {
        bankAccount = BankAccount(id: id, balance: initialBalance)
    }
    func transfer (sender : Transferable , amount: Double,receiver : Transferable ) throws {
            try sender.bankAccount.withdrow(amount: amount)
            try receiver.bankAccount.deposit(amount: amount)
    }
}

var bank = Bank(id: 23423423, initialBalance: 1000000)
let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"


var man = NaturalPerson(id: 1414, initialBalance: 0, name: "Vasia", surname: "Pupkin", birthdate: formatter.date(from: "1994/12/22")!)
var org = LegalPerson(id: 21313, initialBalance: 100, orgName: "qwerty", orgType: OrgType.OAO)

// TEST
print(man.birthdate)

print("bank -  \(bank.bankAccount.balance)")
print("man - \(man.bankAccount.balance)")
print("org - \(org.bankAccount.balance)")
print("---------------------")
do {
    try bank.transfer(sender: bank, amount: 50000, receiver: man)
} catch OperationError.depositError(let info) {
    print(info)
} catch OperationError.withdrowError(let info) {
    print(info)
}
print("bank -  \(bank.bankAccount.balance)")
print("man - \(man.bankAccount.balance)")
print("org - \(org.bankAccount.balance)")
print("---------------------")
do {
    try bank.transfer(sender: man, amount: 5000033, receiver: bank)
} catch OperationError.depositError(let info) {
    print(info)
} catch OperationError.withdrowError(let info) {
    print(info)
}
print("bank -  \(bank.bankAccount.balance)")
print("man - \(man.bankAccount.balance)")
print("org - \(org.bankAccount.balance)")
print("---------------------")
do {
    try bank.transfer(sender: org, amount: 95, receiver: bank)
} catch OperationError.depositError(let info) {
    print(info)
} catch OperationError.withdrowError(let info) {
    print(info)
}
print("bank -  \(bank.bankAccount.balance)")
print("man - \(man.bankAccount.balance)")
print("org - \(org.bankAccount.balance)")