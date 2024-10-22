/// Ejercicio 2: Juego de la ruleta rusa
func Roulet() {
    print("Vamos a jugar a la ruleta rusa.")
    var colt = [Int] ()
    for i in Range(1...6) {
        colt.append(i)
    }
    while colt.count >= 1 {
        var playerInt = 0
        // Turno jugador
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
        // Turno CPU
        let bullet = Int.random(in: 1...colt.count) // posición de la bala
        let cpu = Int.random(in: 1...colt.count) // Jugador 2
        /* Condicionales jugador */
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
        if colt.count == 1 {
            print("Has salido vivo.")
            break
        }
        /* Condicionales CPU */
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
