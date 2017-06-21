//: Playground - noun: a place where people can play

//
//Ввести число, ввести степень. Возвести число в степень. 1 балл;
//
print("Задача 1")
let base = 2
let power = 10
var answer = 1
for _ in 1...power {
    answer*=base
}
print(answer)

print("---------------")
//
//Дан массив [Character]. Записать все гласные в один массив, все согласные в другой массив, остальное в третий массив. 2 балла;
//
print("Задача 2")

let charArray: [Character] = ["a","b","c","d","i","!","\u{E9}"]
var vowels = [Character]() // гласные буквы
var consonant = [Character]() // согласные буквы
var otherletters = [Character]() //другие символы

for char in charArray {
    
    switch char {
    case "a", "e", "i", "o", "u":
        vowels.append(char)
    case "b", "c", "d", "f", "g", "h", "j", "k",
         "l", "m",
         "n", "p", "q", "r", "s", "t", "v", "w",
         "x", "y", "z":
        consonant.append(char)
    default:
        otherletters.append(char)
    }
}

print(vowels,consonant,otherletters)

print("---------------")
//
//Дан текст (String), который может содержать недопустимые слова, например матерные, и дан список этих запрещенных слов, отфильтровать текст, так чтобы вместо недопустимых слов были звездочки  ******. 4 балла;
//
print("Задача 3")
let text = "Hello, do you speak english? Yes? I speak too" //исходная строка
let bannedWords = ["do","speak","too","Hello"] //запрещенные слова
let wordsInTextArr = text.characters.split(separator: " ")
let first = String(wordsInTextArr[0])

print(first)
print("---------------")
