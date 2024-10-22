/// Ejercicio 5: Traductor de números romanos a decimal sin restas
func RomanicInts() {
    print("Escribe un número romano y te diré cuánto vale:")
    var input = readLine()!
    input = input.uppercased()
    let decimalNumber = RomanToDecimal(input, plus: true)
    print("El número \(input) equivale a \(decimalNumber) en decimal.")
 }
/// Traductor
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

/// Ejercicio 6: Traductor de números romanos a decimal con restas
func RomanicTranslate() {
    print("Escribe un número romano y te diré cuánto vale:")
    var input = readLine()!
    input = input.uppercased()
    let decimalNumber: Int = RomanToDecimal(input, plus: false)
    print("El número \(input) equivale a \(decimalNumber) en decimal.")
 }
