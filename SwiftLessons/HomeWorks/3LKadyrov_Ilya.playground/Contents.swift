import UIKit

struct Car {
    var brand:String
    var year:Int
    var volumeTrunk:Float
    var isRunEngine:Bool
    var isOpenWindow:Bool
    var isFilledTrunk:Bool
    init() {
        brand = "car"
        year = 1
        volumeTrunk = 1000.0
        isRunEngine = false
        isOpenWindow = false
        isFilledTrunk = false
    }
    mutating func changeAction(actionWithCar action: actionWithCar) {
        switch action {
        case .windows(open: let open):
            isOpenWindow = open
        case .engine(start: let start):
            isRunEngine = start
        case .trunk(load: let load):
            isFilledTrunk = load
    }
    }
}
struct Trunk {
    var brand:String
    var year:Int
    var volumeBody:Float
    var isRunEngine:Bool
    var isOpenWindow:Bool
    var isFilledBody:Bool
    init() {
        brand = "trunk"
        year = 1
        volumeBody = 1000.0
        isRunEngine = false
        isOpenWindow = false
        isFilledBody = false
    }
    mutating func changeAction(actionWithtrunk action: actionWithtrunk) {
        switch action {
        case .windows(open: let open):
            isOpenWindow = open
        case .engine(start: let start):
            isRunEngine = start
        case .body(load: let load):
            isFilledBody = load
    }
    }
}
enum actionWithCar {
    case windows(open:Bool)
    case engine(start:Bool)
    case trunk(load:Bool)
    
}
enum actionWithtrunk {
    case windows(open:Bool)
    case engine(start:Bool)
    case body(load:Bool)

}

var car1 = Car()
var car2 = Car()
var trunk1 = Trunk()
var trunk2 = Trunk()
car1.changeAction(actionWithCar: .engine(start: true))
car2.changeAction(actionWithCar: .windows(open: true))
trunk1.changeAction(actionWithtrunk: .body(load: true))
trunk2.changeAction(actionWithtrunk: .windows(open: true))
var listCars:[Car] = []
listCars.append(car1)
listCars.append(car2)
var listTrunks:[Trunk] = []
listTrunks.append(trunk1)
listTrunks.append(trunk2)
for car in listCars {
    print(car)
}
for trunk in listTrunks {
    print(trunk)
}
