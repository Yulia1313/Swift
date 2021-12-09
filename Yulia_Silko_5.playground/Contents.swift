import UIKit

var str = "Hello, playground"

//1.Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей)


//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

enum Engine {
    case start
    case stop
}

enum Windows {
    case open
    case close

    var weather: String {
        switch self {
        case .open:
            return "Открыть окно"
        case .close:
            return "Закрыть окно"
        }
    }
}

enum Color {
    case white
    case black
    case grey
    case red
}

enum Door {
    case open
    case close
}

enum Trunk {
    case full
    case empty

}

enum nitro {
    case nitroOn
    case nitroOff
}

enum Headlights: String {
    case on
    case off

    var time: String {
        switch self {
        case .on:
            return "Включить фары"
        case .off:
            return "Выключить фары"
        }
    }
}


let night = Headlights.on.time
print(night)


let rain = Windows.close.weather
print(rain)

protocol CarProtocol {

    var brand: String { get }
    var release: Int { get }
    var engineState: Engine { get set }
    var windowsState: Windows { get set }
    var headlightsState: Headlights { get set }
    var colorCar: Color { get set }
    }


extension CarProtocol {
    mutating func changeColorCar(colorCar: Color) {
        self.colorCar = colorCar
    }
}

class BasicCar: CarProtocol {

    var brand: String
    var release: Int
    var countryManufacture: String
    var engineState: Engine = .start
    var windowsState: Windows = .close
    var headlightsState: Headlights = .off
    var colorCar: Color = .grey

    init(brand: String,
         release: Int,
         countryManufacture: String) {
        self.brand = brand
        self.release = release
        self.countryManufacture = countryManufacture
    }
}

class SportCar:  BasicCar, CustomStringConvertible{
    var nitroState: nitro = .nitroOn
    var doorsCar: Door = .close

    var description: String{
        return " Двигатель \(engineState),Окна \(windowsState),Фары \(headlightsState),Год выпуска \(release)"
    }
}

final class TrunkCar: BasicCar, CustomStringConvertible{
            var nitroState: nitro = .nitroOn
            var doorsTrunk: Door = .close
            var trunkState: Trunk = .full
            var description: String{
            return " Двигатель \(engineState),Окна \(windowsState),Фары \(headlightsState),Год выпуска \(release)"
    }
}

var mersedes = SportCar(brand: "Мерседес", release: 2018, countryManufacture: "Германия")
var bmw = SportCar(brand: "BMW", release: 2020, countryManufacture: "Европа")
var opel = TrunkCar(brand: "Опель", release: 2019, countryManufacture: "США")
var gazel = TrunkCar(brand: "Газель", release: 2015, countryManufacture: "Россия")

mersedes.changeColorCar(colorCar: .black)
bmw.changeColorCar(colorCar: .red)
mersedes.nitroState = .nitroOff
bmw.nitroState = .nitroOn


print(mersedes.description)
print(bmw.description)
print(opel.description)
print(gazel.description)
