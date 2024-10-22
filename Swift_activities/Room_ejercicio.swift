import Foundation
/// Listado de salas disponibles y reservadas inicial
func StartRooms() {
    var RoomManager: [Room] = [] // Creamos la lista de salas
    var room516 = Room(name: "Apps", number: 516, people: [], reserved: false)
    var room408 = Room(name: "DAM", number: 408, people: ["Juan", "Javier"], reserved: true)
    var room311 = Room(name: "Diseño", number: 311, people: ["Jessica"], reserved: false)
    var room520 = Room(name: "Videojuegos 1", number: 520, people: [], reserved: true)
    RoomManager.append(room516)
    RoomManager.append(room408)
    RoomManager.append(room311)
    RoomManager.append(room520)
    RoomList(list: RoomManager)
}
/// Metodo para reservar una sala
func RoomSelector(list: [Room]) {
    var freeList = [String] ()
    for r in list {
        if !r.reserved {
            freeList.append(String(r.number) + " (\(r.name))")
        }
    }
    print("¿Que sala quieres reservar?\nDisponibles: \(freeList)") // Muestra solo las salas libres
    var index: String = readLine()! // Captura el dato introducido por el usuario
    var numindex = Exists(input: index, list: list)
    if numindex > -1 {
        list[numindex].reserved = true
        var i = 0
        var peopleList = [String]()
        // Si la sala esta vacia
        if list[numindex].people.isEmpty {
            print("¿Por quien va a ser reservada?")
            while true {
                i += 1
                print("Dime el nombre \(i):\n(Enter para omitir)")
                guard let member = readLine(),
                      member.isEmpty == false else {
                    break
                }
                peopleList.append(member)
                continue
            }
            list[numindex].people = peopleList
            RoomList(list: list)
        // Si la sala esta ocupada
        } else {
            print("Has reservado la sala, pero hay alguien en ella.")
            print("¿Quieres evacuar la sala?")
            var answer = readLine()!
            // Si se decide evacuar la sala
            if answer.first?.uppercased() == "S" {
                print("Evacuando...\n")
                list[numindex].people = [] // vacia la lista de ocupantes
                sleep(1)
                RoomList(list: list)
            // Reserva sin vaciar la lista de ocupantes
            } else {
                RoomList(list: list)
            }
        }
    }
}
    
/// Listado de salas registradas
func RoomList(list: [Room]) {
    print("Listado de salas registradas:")
    for s in list {
        var text: String = "-" + String(s.number) + " (\(s.name))" + "\n\tEstado: " + s.ShowState(room: s) + s.DictPeople(room: s)
        if s.reserved {
            text += "\n\t" + s.RoomDateFormat(room: s)
        }
        print(text)
    }
    print("\n¿Quieres reservar una de las salas?")
    var answer = readLine()!
    if answer.first?.uppercased() == "S" {
        RoomSelector(list: list)
    }
    print("\n¿Quieres añadir una nueva sala?")
    answer = readLine()!
    if answer.first?.uppercased() == "S" {
        NewRoom(list: list)
    }
}
/// Crea una nueva sala
func NewRoom(list: [Room]) {
    var newNumber = -1
    var newName = ""
    var peopleList = [String]()
    // Validar el numero
    while true {
        print("¿Cual es el numero de la sala?")
        newNumber = Validate(number: readLine()!)
        for n in 0...list.count-1 {
            if newNumber == list[n].number {
                print("Esa sala ya existe.")
                break
            }
        }
        if newNumber > 0 {
            break
        }
    }
    // Validar el nombre
    while true {
        print("¿Cual es el nombre de la sala?")
        newName = readLine()!
        if newName.isEmpty {
            print("Necesita un nombre.")
        } else {
            break
        }
    }
    // Validar los ocupantes
    print("¿Quien la ocupa?")
    var i = 0
    while true {
        i += 1
        print("Dime el nombre \(i):\n(Enter para omitir)")
        guard let member = readLine(),
              member.isEmpty == false else {
            break
        }
        peopleList.append(member)
        continue
    }
    var newRoom = Room(name: newName, number: newNumber, people: peopleList ,reserved: false)
    var new = list
    new.append(newRoom)
    RoomList(list: new)
}
/// Valida que el dato introducido por el usuario sea valido
/// Devuelve el valor numerico
func Validate(number: String) -> Int {
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
                    let num = Int(number)
                    return num ??  -1
                }
            }
        }
    }
    return -1
}
/// Busca la sala especificada por numero o nombre
/// Devuelve su posicion
func Exists(input: String, list: [Room]) -> Int {
    for n in 0...list.count-1 {
        if input.lowercased() == list[n].name.lowercased() {
            return n
        } else if Int(input) == list[n].number {
            return n
        }
    }
    return -1
}
