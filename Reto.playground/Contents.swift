import UIKit

struct Persona{
    let nombre : String
    let apellidoP : String
    let apellidoM : String
    let fechaNac : String
    let dni : Int
    let sexo : String
    let correo : String
    let cantHermanos : UInt8
    let usuario : String?
}


let persona1 = Persona(nombre: "CARLOS JOSÉ", apellidoP: "ROBLES", apellidoM: "GOMES", fechaNac: "06/08/1995", dni: 78451245, sexo : "M", correo:"carlos.roblesg@hotmail.com", cantHermanos: 2, usuario: "carlos.robles")

let persona2 = Persona(nombre: "MIGUEL ANGEL", apellidoP: "QUISPE", apellidoM: "OTERO", fechaNac: "28/12/1995", dni: 79451654, sexo : "M", correo:"miguel.anguel@gmail.com", cantHermanos: 0, usuario: "miguel.anguel")

let persona3 = Persona(nombre: "KARLA ALEXANDRA", apellidoP: "FLORES", apellidoM: "ROSAS", fechaNac: "15/02/1997", dni: 77485812, sexo : "F", correo:"Karla.alexandra@hotmail.com", cantHermanos: 1, usuario: "Karla.alexandra")

let persona4 = Persona(nombre: "NICOLAS", apellidoP: "QUISPE", apellidoM: "ZEBALLOS", fechaNac: "08/10/1990", dni:71748552, sexo : "M", correo:"nicolas123@gmail.com", cantHermanos: 1, usuario: "nicolas123")

let persona5 = Persona(nombre: "PEDRO ANDRE", apellidoP: "PICASSO", apellidoM: "BETANCUR", fechaNac: "17/05/1994", dni: 74823157, sexo : "M", correo:" pedroandrepicasso@gmail.com", cantHermanos: 2, usuario: "pedroandrepicasso")

let persona6 = Persona(nombre: "FABIOLA MARIA", apellidoP: "PALACIO", apellidoM: "VEGA", fechaNac: "02/02/1992", dni: 76758254, sexo : "F", correo:"fabi@hotmail.com", cantHermanos: 0, usuario: "fabi")


let personas:[Persona] = [persona1,persona2,persona3,persona4,persona5,persona6]

//Cálculo del mayor y menor
func calcEdad(cumpleaños: String) -> Int {
    let formatoFecha = DateFormatter()
    formatoFecha.dateFormat = "dd/MM/yyyy"
    let fechaCumpleaños = formatoFecha.date(from: cumpleaños)
    let calendario: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    let now = Date()
    let calEdad = calendario.components(.year, from: fechaCumpleaños!, to: now, options: [])
    let edad = calEdad.year
    return edad!
}


var mayor : Int = 0
var menor : Int = 100
var t : Int
var nombreMayor : String = ""
var nombreMenor : String = ""

for(_,valor) in personas.enumerated(){
    
    t = calcEdad(cumpleaños: "\(valor.fechaNac)")
    
    if t > mayor {
        mayor=t
        nombreMayor = valor.nombre
    }
   
    if t < menor {
        menor=t
        nombreMenor = valor.nombre
    }

}
print("\(nombreMayor) es mayor que todos con \(mayor) años")
print("\(nombreMenor) es menor que todos con \(menor) años")


// Lista de hombres y mujeres
var arrayHombres : [Persona]=[persona1,persona2,persona4,persona5]
var arrayMujeres : [Persona]=[persona3,persona6]

print("Hay \(arrayHombres.count) hombres en el grupo")
print("Hay \(arrayMujeres.count) mujeres en el grupo")


// Lista de personas que tienen mas de 2 hermanos
var contador : Int8=0
for(_,valor) in personas.enumerated(){
    valor.cantHermanos
    if valor.cantHermanos >= 2{
        contador += 1
    }
}
print("Hay \(contador) personas que tienen 2 o más hermanos")


//Crear formato de nombre. Ejemplo  “Luis Inga M.”

for(_,valor) in personas.enumerated(){

    var nom = valor.nombre
    var apem = valor.apellidoM
    var r = nom.split(separator: " ")
    var r2 = apem.components(separatedBy: "")
    print(r.first, valor.apellidoP, r2.first)
    
}
