//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var x = [1,2,3]
var y = x
y.append(4)

let a = NSMutableArray(array: [1,2,3])
let b: NSArray = a
a.insertObject(4, atIndex: 3)
b

let a1 = NSMutableArray(array: [1,2,3])
let b1 = a1.copy()as! NSArray
a1.insertObject(4, atIndex: 3)
b1

// map
let fibs = [1,2,3]
var squared:[Int] = []
for fib in fibs{
    squared.append(fib * fib)
}
squared

let squared1 = fibs.map{fib in fib * fib}
squared1

extension Array{
    func map<U>(transform: (Element)->U)->[U]{
        var result:[U] = []
        result.reserveCapacity(self.count)
        for x in self{
            result.append(transform(x))
        }
        return result
    }
}

extension SequenceType{
    func findElement(match: Generator.Element->Bool) -> Generator.Element? {
        for element in self where match(element){
            return element
        }
        return nil
    }
}

extension Array{
    func accumulate<U>(initial: U, combine: (U, Element) -> U) -> [U] {
        var running = initial
        return self.map{ next in
            running = combine(running, next)
            return running
        }
    }
}

[1,2,3,4].accumulate(0, combine: +)

extension Array{
    func filter(includeElement: Element -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where includeElement(x){
            result.append(x)
        }
        return result
    }
}

extension SequenceType{
    public func allMatch(predicate: Generator.Element -> Bool) -> Bool{
        return !self.contains{!predicate($0)}
    }
}


fibs

var total = 0
for num in fibs{
    total = total + num
}
total

fibs.reduce(0){total, num in total + num}
fibs.reduce(0, combine: +)

fibs.reduce(""){str, num in str + "\(num)\n"}

extension Array{
    func reduce<U>(initial: U, combine: (U, Element) -> U) -> U {
        var result = initial
        for x in self{
            result = combine(result, x)
        }
        return result
    }
}

extension Array{
    func map2<U>(transform: Element -> U) -> [U] {
        return reduce([]){
            $0 + [transform($1)]
        }
    }
    
    func filter2(includeElement: Element -> Bool) -> [Element] {
        return reduce([]){
            includeElement($1) ? $0 + [$1] : $0
        }
    }
}

let abc = [1,2,3].map2{fib in fib * fib}
abc





