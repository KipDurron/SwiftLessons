import UIKit

//Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
enum DNSError: Error {
    case notFound(productName: String)
    case insufficientFunds(coinsNeeded: Float)
}

struct Product {
    let name: String
    let characteristic: Float
    var cost: Float
}
class DNS {
    var products:[String: Product] = [
        "Gygabate Cpu": Product(name: "cpu", characteristic: 5.0, cost: 3000.0),
        "Nvidia videoCard": Product(name: "videoCard", characteristic: 8000.0, cost: 40000.0),
        "AMD ram": Product(name: "ram", characteristic: 16.0, cost: 10000.0),
        
    ]
    
    func checkProduct(productName: String) throws -> Product{
        guard let product = self.products[productName] else {
            throw DNSError.notFound(productName: productName)
        }
        return product
    }
    
    func buyProduct(productName: String, clientMoney: Float) throws -> Product {
        let product = try checkProduct(productName: productName)
        guard product.cost < clientMoney else {
            throw DNSError.insufficientFunds(coinsNeeded: product.cost)
        }
        return product
    }

}
var dns = DNS()
do {
    let myProduct3 = try dns.buyProduct(productName: "Gygabate Cpu", clientMoney: 10000.0)
    print(myProduct3.name)
} catch DNSError.insufficientFunds(coinsNeeded: let countsNeeded){
    print("couns neaded '\(countsNeeded)'")
} catch DNSError.notFound(productName: let productName){
    print("product with name \(productName) not founded")
}

//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
enum ServerError: Error {
    case serverNotAvaible(serverName: String, msg: String)
    case serverNotFound(serverName: String, msg: String)
}
struct Server {
    let name: String
    var connect: Bool
}


class ManageServer {
    var servers: [String: Server] = [
        "Apach 7.0": Server(name: "Apach", connect: true),
        "My sql 10.1": Server(name: "MySql", connect: false)]
    
    func foundServer(serverName: String) -> (Server?, ServerError?) {
        guard let server = self.servers[serverName] else {
            return (nil, ServerError.serverNotFound(serverName: serverName, msg: "Server not found"))
        }
        return (server, nil)
    }
    
    func getServer(serverName: String) -> (Server?, ServerError?) {
        let foundedServer = self.foundServer(serverName: serverName)
        guard let _ = foundedServer.0 else {
            return foundedServer
        }
        guard foundedServer.0!.connect else {
            return (nil, ServerError.serverNotAvaible(serverName: serverName, msg: "Server not avaible"))
        }
        return foundedServer
    }
}

var ms = ManageServer()
var serverName = "My sql 10.1"
let resAction = ms.getServer(serverName: serverName)
if let server = resAction.0 {
    print("server \(server.name) exist and avaible")
} else if let error = resAction.1 {
    switch error {
    case ServerError.serverNotAvaible(serverName: let name, msg: let msg):
        print("Error: \(msg) with server name: \(name)")
    case ServerError.serverNotFound(serverName: let name, msg: let msg):
        print("Error: \(msg) with server name: \(name)")
    }
    
    
}
