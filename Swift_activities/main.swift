/*func CaracteresEspeciales(name: String) -> Bool {
    let especiales = "¡¿!?@#¢$/()+-*.,:;{}[]"
    for char in name {
        for especial in especiales {
            if char == especial {
                return true
            }
        }
    }
    return false
}
print("¿Cómo te llamas?")
var name = readLine()! // El ! fuerza a ser String
// readLine() es como input() de Python
var incorrecto = false
repeat {
    if name.count > 10 { // Límite dse caracteres
        print("Error: nombre demasiado largo")
        incorrecto = true
        name = readLine()!
    } else if name.first!.isNumber { // No empieza por número
        print("Error: No puede empezar por un número")
        incorrecto = true
        name = readLine()!
    } else if CaracteresEspeciales(name: name) { // Tiene caracteres especiales
        print("Error: tiene caracteres especiales")
        incorrecto = true
        name = readLine()!
    } else {
        incorrecto = false
    }
} while incorrecto

print("Hola", name)
*/

/* Llamada a ejercicios */
//Average()
//Roulet()
//AverageWithMethod()
//CensoredWords()
//RomanicInts()
//RomanicTranslate()
//ReduceAverage()
CensoredWithMap()
