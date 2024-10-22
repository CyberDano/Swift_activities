/// Ejercicio 4: Pedir una frase y censurar palabras clave
func CensoredWords() {
    print("Escribe algo:")
    let sentence = readLine()!
    if !sentence.isEmpty {
        Validator(text: sentence)
    }
}
/// Censura palabras y modifica la frase
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
/// Comprueba si hay palabras sospechosas
func ContainsLetter(word: Character) -> Bool {
    let suspiciousLetters: [Character] = ["J", "j", "P", "p", "M", "m"]
    return suspiciousLetters.contains(word)
}

/// Ejercicio 7 (2/2): Hacer el ejercicio 4 usando map{}
func CensoredWithMap() {
    print("Escribe algo:")
    let sentence: String = readLine()!
    if !sentence.isEmpty {
        let censoredSentence: String = ValidatorMap(text: sentence)
        print("He modificado el contenido.")
        print("La frase ahora es: " + censoredSentence)
    }
}
/// Valida la frase
func ValidatorMap(text: String) -> String {
    let words : [String] = text.components(separatedBy: " ")
    let censoredWords: [String] = words.map { word -> String in
        if ContainsLetter(word: word.first!) {
            return String(word.first!) + String(repeating: "*", count: word.count - 1)
        } else {
            return word
        }
    }
    return censoredWords.joined(separator: " ") + "."
}
