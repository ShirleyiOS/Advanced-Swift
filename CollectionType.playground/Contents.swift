//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var x = [1,2,3]
var y = x
y.append(4)
print(x)
print(y)

let a = NSMutableArray(array: [1,2,3])
let b: NSArray = a
a.insert(4, at: 3)
b

let a1 = NSMutableArray(array: [1,2,3])
let b1 = a1.copy()as! NSArray
a1.insert(4, at: 3)
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
