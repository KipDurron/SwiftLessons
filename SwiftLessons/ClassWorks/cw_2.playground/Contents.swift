import UIKit

var str = "Hello, playground"
!true
let x = 5
let y = 7
(x < y) && (x == y)
if x == 5 {
    print(x)
} else if y == 7 {
    print(y)
} else {
    print("no")
}

x == 5 ? print("x == 5") : print("x != 5")

let h = 100
let isHundred = true
let rr = 1 + (isHundred ? 2 : 3)
print(rr)

var test: String? = "Test"
test = nil

if let i = test {
    print(i)
    print(test!)
} else {
    print("nil")
}

let userMark:Int = 5
switch userMark {
case 1:
    print("не сдан")
case 5:
    print("cool")
    print("very good")
default:
    print("so so")
}

let level:Character = "A"
switch level {
case "A":
    print("A")
    fallthrough
case "B":
    print("B")
    fallthrough
default:
    print("def")
    
}

var D = 10
switch D {
case _ where D > 0:
    print(D)
default:
    break
}

var totalSum = 0

for i in 1...5 {
    totalSum += i
}
print(totalSum)

for _ in 1...5 {
    totalSum += 1
}
print(totalSum)

var mysic = ["Rock", "Hip-Hop"]
for itemMusic in mysic {
    print("I love \(itemMusic)")
}

var country = ["RU" : "Russia", "ENG" : "English"]
for (key, value) in country {
    print(key, value)
}

var i = 0

while i < 10 {
    i += 1
}

func myFunc(firstValue someValue:Int, anotherValue:Int, _ value: Int) -> String {
    return String(someValue) + String(anotherValue) + String(value)
}

print(myFunc(firstValue: 1, anotherValue: 2, 3))

func changeValue(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
    
}

var a = 1
var b = 2
changeValue(&a, &b)
print(a,b)
