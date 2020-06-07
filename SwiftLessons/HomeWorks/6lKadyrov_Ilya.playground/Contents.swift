import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

class Queue<T: Numeric> {
    private var elements: [T] = []
    
    func push(newElemt: T) {
        self.elements.append(newElemt)
    }
    
    func pop() -> T {
        return self.elements.removeFirst()
    }
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var filtredElements: [T] = []
        self.elements.forEach { element in
            if predicate(element) {
                filtredElements.append(element)
            }
        }
        return filtredElements
    }
    
    func map(predicate: (T) -> T) -> [T]{
        return self.elements.map(predicate)
    }
    
    subscript (findIndex: Int) -> T? {
        var currentIndex = 0
        while currentIndex < self.elements.count {
            if findIndex == currentIndex {
                return self.elements[currentIndex]
            }
            currentIndex += 1
        }
        return nil
    }
}

var testQueue = Queue<Float>()
testQueue.push(newElemt: 1.0)
testQueue.push(newElemt: 2.0)
testQueue.push(newElemt: 3.0)
print(testQueue.pop())
testQueue.push(newElemt: 1.0)
var filtred = testQueue.filter { element in
    return element == 1.0
}
print(filtred)
var testQueueInt = Queue<Int>()
testQueueInt.push(newElemt: 1)
testQueueInt.push(newElemt: 2)
testQueueInt.push(newElemt: 3)
print()
var mappedQueue = testQueueInt.map { element in
    return element * element
}
print(mappedQueue)


var resultSubscript = testQueueInt[100]
if let res = testQueueInt[2]{
    print(res)
} else {
    print("Element with this index not founded")
}

