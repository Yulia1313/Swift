import UIKit

var str = "Hello, playground"

enum nitro {
    case nitroOn
    case nitroOff
}

enum luggage {
    case trunkIsFull
    case TrunkIsEmpty
}

class Car {
    var brand: String
    var release: Int
    init (brand: String,
         release: Int) {
        self.brand = brand
        self.release = release
    }
}

class trunkCar: Car {
    var trunk: luggage
    init(brand: String,
         release: Int,
         trunk: luggage) {
        self.trunk = trunk
        super.init(brand: brand,
                   release: release)
    }

    func trunkState() {
        if trunk == .trunkIsFull {
            print("Багажник полон")
        } else{
            print("Багажник пуст")
        }
    }
}

class sportCar: Car {
    var goFast: nitro
    init(brand: String,
         release: Int,
         goFast: nitro) {
        self.goFast = goFast
        super.init(brand: brand,
                   release: release)
    }

    func nitroState() {
        if goFast == .nitroOn {
            print("Спортивная машина едет быстрее")
        } else{
            print("Спортивная машина едет медленее")
        }
    }
}

let opel = trunkCar(brand: "Opel", release: 2005, trunk: .trunkIsFull)
opel.trunkState()
let mersedes = sportCar(brand: "Mersedes", release: 2019, goFast: .nitroOn)
mersedes.nitroState()
