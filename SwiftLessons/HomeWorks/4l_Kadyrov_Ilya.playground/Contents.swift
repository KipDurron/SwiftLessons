import UIKit

class Car {
    var brand:String
    var year:Int
    var isRunEngine:Bool
    var isOpenWindow:Bool
    init(brand: String, year:Int) {
        self.brand = brand
        self.year = year
        isRunEngine = false
        isOpenWindow = false
    }
    func changeAction(actionWithCar action: actionWithCar) {
        
    }
    func getDesc() -> String {
        return "brand = \(self.brand), year = \(self.year), isRunEngine = \(self.isRunEngine), isOpenWindow = \(self.isOpenWindow)"
    }
}
class TrunkCar: Car {
    var volumeTrunk: Float
    var isFilledTrunk:Bool
    init(brand: String, year:Int, volumeTrunk: Float) {
        self.volumeTrunk = volumeTrunk
        self.isFilledTrunk = false
        super.init(brand: brand, year: year)
    }
    override func changeAction(actionWithCar action: actionWithCar) {
            switch action {
            case .windows(open: let open):
                self.isOpenWindow = open
            case .engine(start: let start):
                self.isRunEngine = start
            case .trunk(load: let load):
                self.isFilledTrunk = load
            default:
                break
        }
    }
    override func getDesc() -> String {
        return super.getDesc() + "volumeTrunk = \(self.volumeTrunk), isFilledTrunk = \(self.isFilledTrunk)"
    }
}
class SportCar: Car {
    var colorSpoiler: String
    var isOpenSpoiler:Bool
    init(brand: String, year:Int, colorSpoiler: String) {
        self.colorSpoiler = colorSpoiler
        self.isOpenSpoiler = false
        super.init(brand: brand, year: year)
    }
    override func changeAction(actionWithCar action: actionWithCar) {
            switch action {
            case .windows(open: let open):
                self.isOpenWindow = open
            case .engine(start: let start):
                self.isRunEngine = start
            case .spoiler(open: let open):
                self.isOpenSpoiler = open
            default:
                break
        }
    }
    override func getDesc() -> String {
        return super.getDesc() + "colorSpoiler = \(self.colorSpoiler), isOpenSpoiler = \(self.isOpenSpoiler)"
    }
}
enum actionWithCar {
    case windows(open:Bool)
    case engine(start:Bool)
    case trunk(load:Bool)
    case spoiler(open:Bool)
}
let sportCar1 = SportCar(brand: "Nisan", year: 1, colorSpoiler: "red")
let sportCar2 = SportCar(brand: "Mersedes", year: 5, colorSpoiler: "green")
var trunkCar1 = TrunkCar(brand: "Toyota", year: 20, volumeTrunk: 1000.0)
var trunkCar2 = TrunkCar(brand: "Lada", year: 12, volumeTrunk: 5000.0)
sportCar1.changeAction(actionWithCar: .engine(start: true))
sportCar2.changeAction(actionWithCar: .spoiler(open: true))
trunkCar1.changeAction(actionWithCar: .trunk(load: false))
trunkCar2.changeAction(actionWithCar: .windows(open: true))
var listCars:[Car] = []
listCars.append(sportCar1)
listCars.append(sportCar2)
listCars.append(trunkCar1)
listCars.append(trunkCar1)
for car in listCars {
    print(car.getDesc())
}
