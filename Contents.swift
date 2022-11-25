import UIKit

struct Persona {
    let nombre: String
    let apePaterno: String
    let apeMaterno: String
    let fechaNaci: String
    let dni: Int
    let sexo: String
    let email: String
    let numHermano: Int
    var usuario: String?
}

var lista = [
    Persona(nombre: "CARLOS JOSÉ", apePaterno: "ROBLES", apeMaterno: "GOMES", fechaNaci: "06/08/1995", dni: 78451245, sexo: "M", email: "carlos.roblesg@hotmail.com", numHermano: 2),
    Persona(nombre: "MIGUEL ANGEL", apePaterno: "QUISPE", apeMaterno: "OTERO", fechaNaci: "28/12/1995", dni: 79451654, sexo: "M", email: "miguel.anguel@gmail.com", numHermano: 0),
    Persona(nombre: "KARLA ALEXANDRA", apePaterno: "FLORES", apeMaterno: "ROSAS", fechaNaci: "15/02/1997", dni: 77485812, sexo: "F", email: "Karla.alexandra@hotmail.com", numHermano: 1),
    Persona(nombre: "NICOLAS", apePaterno: "QUISPE", apeMaterno: "ZEBALLOS", fechaNaci: "08/10/1990", dni: 71748552, sexo: "M", email: "nicolas123@gmail.com", numHermano: 1),
    Persona(nombre: "PEDRO ANDRE", apePaterno: "PICASSO", apeMaterno: "BETANCUR", fechaNaci: "17/05/1994", dni: 74823157, sexo: "M", email: "pedroandrepicasso@gmail.com", numHermano: 2),
    Persona(nombre: "FABIOLA MARIA", apePaterno: "PALACIO", apeMaterno: "VEGA", fechaNaci: "02/02/1992", dni: 76758254, sexo: "F", email: "fabi@hotmail.com", numHermano: 0)
]

// Persona con mayor y menor edad

func calcAge(birthday: String) -> Int {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "dd/MM/yyyy"
    let birthdayDate = dateFormater.date(from: birthday)
    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    let now = Date()
    let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
    let age = calcAge.year
    return age!
}

let edades = lista.map{$0.fechaNaci}

var listaEdad: [Int] = []
for edad in edades {
 let newEdad = calcAge(birthday: edad)
    listaEdad.append(newEdad)
}
print("La persona con la mayor edad es \(listaEdad.max()!)")
print("La persona con la menor edad es \(listaEdad.min()!)\n")


//Lista de Cantidad de hombres y mujeres

let listaHombres=lista.filter{$0.sexo=="M"}
let listaMujeres=lista.filter{$0.sexo=="F"}

print("La cantidad de hombres es \(listaHombres.count)")
print("La cantidad de mujeres es \(listaMujeres.count)\n")


//Lista de personas con mas 2 hermanos

let listaPersona = lista.filter{$0.numHermano >= 2 }.map{$0.nombre}

print("Imprimir lista con 2 o mas hermanos")
print(listaPersona)
print("\n")

// imprimir nombres con nuevo formato
print("Nombres con nuevo formato")
for persona in lista {
    let primerNombre = persona.nombre.split(separator: " ").first!.capitalized
    let primerApellido = persona.apePaterno.capitalized
    let letraMaterno = persona.apeMaterno.prefix(1).capitalized
    print("\(primerNombre) \(primerApellido) \(letraMaterno). ")
}

//Lista de usuarios generados

let usuarios = lista.map{$0.email.split(separator: "@").first!}

print("\nImprimir lista con los usuarios generados")
print(usuarios)


