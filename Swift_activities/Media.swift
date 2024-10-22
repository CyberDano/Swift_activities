import Foundation

/// Ejercicio 1: Hacer media de cinco números
func Average() {
    var lista = [Float] ()
    print("Vamos a hacer una media entre cinco valores")
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
    let result = Float((lista[0] + lista[1] + lista[2] + lista[3] + lista[4])/5)
    print("La media de estos números es: " + String(result))
}
/// Valida el dato introducido por teclado
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

/// Ejercicio 3: Ejercicio 1 con métodos
func AverageWithMethod() {
    var lista = [Float] ()
    print("Vamos a hacer una media entre cinco valores")
    for n in 0...4 {
        while lista.count <= n {
            print("Dime el valor " + String(n+1) + ":")
            let number = readLine()!
            if Correct(number: number) {
                lista.append(Float(number)!)
            }
        }
    }
    AverageResult(lista: lista)
}
/// Muestra la media
func AverageResult(lista : Array<Float>) {
    let result = Float((lista[0] + lista[1] + lista[2] + lista[3] + lista[4])/5)
    print("La media de estos números es: " + String(result))
}

/// Ejercicio 7 (1/2): Hacer ejercicio 1 usando reduce()
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
    let average: Float = lista.reduce(0, +) / Float(lista.count)
    print("La media de estos números es: \(average)")
}
