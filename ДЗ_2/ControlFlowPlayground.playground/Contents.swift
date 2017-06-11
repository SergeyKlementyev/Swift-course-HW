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
        vowels+=[char]
    case "b", "c", "d", "f", "g", "h", "j", "k",
         "l", "m",
         "n", "p", "q", "r", "s", "t", "v", "w",
         "x", "y", "z":
        consonant+=[char]
    default:
        otherletters+=[char]
    }
}

print(vowels,consonant,otherletters)

print("---------------")
//
//Дан текст (String), который может содержать недопустимые слова, например матерные, и дан список этих запрещенных слов, отфильтровать текст, так чтобы вместо недопустимых слов были звездочки  ******. 4 балла;
//
print("Задача 3")
let text = "Hello, do you speak english? Yes? I speak too" //исходная строка
var filteredText = String() // отфильтрованный текст
let bannedWords = ["do","speak","too","Hello"] //запрещенные слова

var wordBuffer = String() //буффер, в который записываюстя буквенные символы, чтобы получить слова

for char in text.characters {
    switch char {
    case "a", "e", "i", "o", "u", "b", "c", "d", "f", "g", "h", "j", "k",
         "l", "m",
         "n", "p", "q", "r", "s", "t", "v", "w",
         "x", "y", "z",
         "A", "E", "I", "O", "U", "B", "C", "D", "F", "G", "H", "J", "K",
         "L", "M",
         "N", "P", "Q", "R", "S", "T", "V", "W",
         "X", "Y", "Z":
        wordBuffer.append(char)
    default:
        if bannedWords.contains(wordBuffer) {
            filteredText.append("*****")
        } else {
            filteredText.append(wordBuffer)
        }
        filteredText.append(char)
        wordBuffer = ""
    }
}
// В буффере может что-то остаться, так как запись идет только при попадании на не букву
// Выведем строку из буфера, если она там есть
if wordBuffer != "" {
    if bannedWords.contains(wordBuffer) {
        filteredText.append("*****")
    } else {
        filteredText.append(wordBuffer)
    }
    wordBuffer = ""
}

print(filteredText)
print("---------------")
