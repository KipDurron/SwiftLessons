import UIKit
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var brand:String { get set }
    var year:Int { get set }
    var isRunEngine:Bool { get set }
    var isOpenWindow:Bool { get set }
    func action(actionWithCar action: actionWithCar)
}
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    mutating func changeRunEngine(actionWithCar action: actionWithCar) {
            switch action {
            case .engine(start: let start):
                self.isRunEngine = start
            default:
                break
        }
    }
   mutating func changeOpenWindow(actionWithCar action: actionWithCar) {
            switch action {
            case .windows(open: let open):
                self.isOpenWindow = open
            default:
                break
        }
    }
}

//3.Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class TrunkCar: Car {
    var brand: String
    var year: Int
    var volumeTrunk: Float
    var isFilledTrunk:Bool = false
    var isRunEngine: Bool = false
    var isOpenWindow: Bool = false
    
    func action(actionWithCar action: actionWithCar) {
        switch action {
        case .trunk(load: let load):
            self.isFilledTrunk = load
        default:
            break
        }
    }
    
    init(brand: String, year:Int, volumeTrunk: Float) {
        self.brand = brand
        self.year = year
        self.volumeTrunk = volumeTrunk
    }
}
class SportCar: Car {
    var brand: String
    var year: Int
    var colorSpoiler: String
    var isOpenSpoiler:Bool = false
    var isRunEngine: Bool = false
    var isOpenWindow: Bool = false
    
    func action(actionWithCar action: actionWithCar) {
        switch action {
        case .spoiler(open: let open):
            self.isOpenSpoiler = open
        default:
            break
        }
    }

    init(brand: String, year:Int, colorSpoiler: String) {
        self.brand = brand
        self.year = year
        self.colorSpoiler = colorSpoiler
    }
}
//Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "brand = \(self.brand), year = \(self.year), isRunEngine = \(self.isRunEngine), isOpenWindow = \(self.isOpenWindow), isFilledTrunk = \(self.isFilledTrunk), volumeTrunk = \(self.volumeTrunk)"
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "brand = \(self.brand), year = \(self.year), isRunEngine = \(self.isRunEngine), isOpenWindow = \(self.isOpenWindow), isOpenSpoiler = \(self.isOpenSpoiler), colorSpoiler = \(self.colorSpoiler)"
    }
}

enum actionWithCar {
    case windows(open:Bool)
    case engine(start:Bool)
    case trunk(load:Bool)
    case spoiler(open:Bool)
}
var sportCar1 = SportCar(brand: "Nisan", year: 1, colorSpoiler: "red")
var sportCar2 = SportCar(brand: "Mersedes", year: 5, colorSpoiler: "green")
var trunkCar1 = TrunkCar(brand: "Toyota", year: 20, volumeTrunk: 1000.0)
var trunkCar2 = TrunkCar(brand: "Lada", year: 12, volumeTrunk: 5000.0)
sportCar1.action(actionWithCar: .spoiler(open: true))
sportCar2.changeRunEngine(actionWithCar: .engine(start: true))
trunkCar1.action(actionWithCar: .trunk(load: true))
trunkCar2.changeOpenWindow(actionWithCar: .windows(open: true))
print(sportCar1)
print(sportCar2)
print(trunkCar1)
print(trunkCar2)
