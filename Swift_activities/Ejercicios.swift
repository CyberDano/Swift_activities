//  Ejercicios.swift
//  Prueba_comandos
//
//  Created by Leonid Daniel Gómez Gómez on 25/09/2024.

import Foundation

/*
 Ejercicio 1: hacer media de cinco números
 */
func Average() {
    var lista = [Float] ()
    print("Vamos a hacer una media entre cinco valores")
    for n in 0...4 {
        while lista.count <= n {
            print("Dime el valor \(n+1):")
            let number = readLine()!
            if number.isEmpty {
                print("Valor no introducido.")
            } else {
                if number.contains(",") {
                    print("Formato decimal no válido. Prueba otra vez.")
                } else {
                    for n in number {
                        if n.isLetter || n.isSymbol {
                            print("No acepto ni letras ni símbolos. Prueba otra vez.")
                            break
                        } else {
                            lista.append(Float(number)!)
                        }
                    }
                }
            }
        }
    }
    let result = Float((lista[0] + lista[1] + lista[2] + lista[3] + lista[4])/5)
    print("La media de estos números es: " + String(result))
}

/*
 Ejercicio 2: Juego de la ruleta rusa
 */
func Roulet() {
    print("Vamos a jugar a la ruleta rusa.")
    var colt = [Int] ()
    for i in Range(1...6) {
        colt.append(i)
    }
    while colt.count >= 1 {
        var playerInt = 0
        // Jugador
        while playerInt == 0 {
            print("Selecciona una posición del tambor.")
            print("Números disponibles:", colt)
            let player_number = readLine()!
            if Correct(number: player_number) {
                if Int(player_number)! > colt.count {
                    print("Posición del tambor no disponible.")
                } else {
                    playerInt = Int(player_number)!
                }
            }
        }
        let bullet = Int.random(in: 1...colt.count) // posición de la bala
        let cpu = Int.random(in: 1...colt.count) // Jugador 2
        //Condicionales
        //var playerDead = false
        print("Has decidido usar el hueco", playerInt)
        if playerInt == bullet {
            print("-Resultado: te has disparado.")
            print("El jugador 2 ha salido vivo.")
            break
        }
        else {
            print("-Resultado: espacio vacío.")
            colt.remove(at: colt.count-1)
        }
        if colt.count == 1 /* && !playerDead*/ {
            print("Has salido vivo.")
            break
        }
        //Condicionales CPU
        print("El jugador 2 ha usado el hueco", cpu)
        if cpu == bullet {
            print("-Resultado: le han disparado.")
            print("Has salido vivo.")
            break
        }
        else {
            print("-Resultado: espacio vacío.")
            colt.remove(at: colt.count-1)
        }
    }
}
func Correct(number: String) -> Bool {
    if number.isEmpty {
        print("Valor no introducido.")
    } else {
        if number.contains(",") || number.contains(".") {
            print("Solo enteros. Prueba otra vez.")
        } else {
            for n in number {
                if n.isLetter || n.isSymbol {
                    print("No acepto ni letras ni símbolos. Prueba otra vez.")
                } else {
                    return true
                }
            }
        }
    }
    return true
}

/*
 Ejercicio 3: Ejercicio 1 con métodos
 */
func AverageWithMethod() {
    var lista = [Float] ()
    print("Vamos a hacer una media entre cinco valores")
    for n in 0...4 {
        while lista.count <= n {
            print("Dime el valor " + String(n+1) + ":")
            let number = readLine()!
            if NumberFormat(input: number) {
                lista.append(Float(number)!)
            }
        }
    }
    AverageResult(lista: lista)
}

func AverageResult(lista : Array<Float>) {
    let result = Float((lista[0] + lista[1] + lista[2] + lista[3] + lista[4])/5)
    print("La media de estos números es: " + String(result))
}

func NumberFormat(input: String) -> Bool {
    if input.isEmpty {
        print("Valor no introducido.")
        return false
    } else {
        if input.contains(",") {
            print("Formato decimal no válido. Prueba otra vez.")
            return false
        } else {
            for n in input {
                if n.isLetter || n.isSymbol {
                    print("No acepto ni letras ni símbolos. Prueba otra vez.")
                    return false
                } else {
                    return true
                }
            }
        }
    }
    return true
}

/*
 Ejercicio 4: Pedir una frase y censurar palabras clave
 */
func CensoredWords() {
    print("Escribe algo:")
    let sentence = readLine()!
    if !sentence.isEmpty {
        Validator(text: sentence)
    }
}
// Censura palabras y modifica la frase
func Validator(text: String) {
    var words = text.components(separatedBy: " ")
    for w in 0...words.count-1 {
        var palabra = words[w]
        let n: Character = palabra[palabra.startIndex]
        if ContainsLetter(word: n) {
            var corrected = ""
            corrected += String(palabra[palabra.startIndex])
            for _ in 1...palabra.count-1 {
                corrected += "*"
            }
            words[w] = corrected
        }
    }
    var censored = ""
    for w in 0...words.count-1 {
        censored += words[w]
        if w < words.count-1 {
            censored += " "
        } else {
            censored += "."
        }
    }
    print("He modificado el contenido.")
    print("La frase ahora es: " + censored)
}
// Comprueba si hay palabras sospechosas
func ContainsLetter(word: Character) -> Bool {
    if word == "J" || word == "j" {
        print("Hay una palabra sospechosa.")
        return true
    } else if word == "P" || word == "p" {
        print("Hay una palabra sospechosa.")
        return true
    } else if word == "M" || word == "m" {
        print("Hay una palabra sospechosa.")
        return true
    } else {
        return false
    }
}

/*
 Ejercicio 5: Traductor de números romanos a decimal sin restas
 */
func RomanicInts() {
    print("Escribe un número romano y te diré cuánto vale:")
    var input = readLine()!
    input = input.uppercased()
    let decimalNumber = RomanToDecimal(input, plus: true)
    print("El número \(input) equivale a \(decimalNumber) en decimal.")
 }
/*
Funcion para traducir
*/
func RomanToDecimal(_ roman: String, plus: Bool) -> Int {
    let romanNumerals: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var result = 0
    if plus {
        for char in roman {
            let value = romanNumerals[char]!
            result += value
        }
    } else {
        var prevValue = 0
        for char in roman.reversed() {
            let value = romanNumerals[char]!
            if value < prevValue {
                result -= value
            } else {
                result += value
            }
            prevValue = value
        }
    }
    return result
}

/*
 Ejercicio 6: Traductor de números romanos a decimal con restas
 */
func RomanicTranslate() {
    print("Escribe un número romano y te diré cuánto vale:")
    var input = readLine()!
    input = input.uppercased()
    let decimalNumber = RomanToDecimal(input, plus: false)
    print("El número \(input) equivale a \(decimalNumber) en decimal.")
 }
    
/*
Ejercicio 7 (1/2): Hacer ejercicio 1 usando reduce
*/
func ReduceAverage() {
    var lista: [Float] = []
    print("Vamos a hacer una media entre cinco valores enteros.")
    var i = 0
    for _ in 0...4 {
        i += 1
        while true {
            print("Dime el valor \(i):")
            guard let numberString = readLine(),
            let number = Float(numberString),
            numberString.contains(".") == false else {
                print("Valor no válido.")
                continue
            }
            lista.append(number)
            break
        }
    }
    let average = lista.reduce(0, +) / Float(lista.count)
    print("La media de estos números es: \(average)")
}

/*
Ejercicio 7 (2/2): Hacer el ejercicio 4 usando map
*/
func CensoredWithMap() {
    print("Escribe algo:")
    let sentence = readLine()!
    if !sentence.isEmpty {
        let censoredSentence = ValidatorMap(text: sentence)
        print("He modificado el contenido.")
        print("La frase ahora es: " + censoredSentence)
    }
}
// Valida la frase
func ValidatorMap(text: String) -> String {
    let words = text.components(separatedBy: " ")
    let censoredWords = words.map { word -> String in
        if ContainsCharacter(word: word.first!) {
            return String(word.first!) + String(repeating: "*", count: word.count - 1)
        } else {
            return word
        }
    }
    return censoredWords.joined(separator: " ") + "."
}
// Comprueba el caracter
func ContainsCharacter(word: Character) -> Bool {
    let sentence = "" + String(word)
    let suspiciousLetters = ["J", "j", "P", "p", "M", "m"]
    return suspiciousLetters.contains(sentence)
}
