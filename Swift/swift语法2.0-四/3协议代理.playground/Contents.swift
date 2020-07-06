import UIKit

//MARK --- 协议 基础
protocol Pet {
    var name: String{get set}
    
    func playWith()
    func fed()
    
    init(name:String)
}

class Animal {
    var typr: String = "mammal"
}

class Dog: Animal, Pet {
    required init(name: String) {
        self.name = name
    }
    
    
    func playWith() {
        
    }
    
    func fed() {
        
    }
    
    var name: String = "Puppy"
    
}


class Bird: Animal {
    var name: String = "yingwu"
    init(name:String) {
        self.name = name
    }
}


class Parrot: Bird, Pet {
    func playWith() {
        
    }
    
    func fed() {
        
    }
    
    required override init(name: String) {
        super.init(name: name )
    }
    
    
}


// MARK -- 类型别名-- 关联类型。  typealias

typealias Length = Double

extension Length{
    var km: Length { return self * 1000 }
    var m: Length { return self }
    var cm: Length {return self / 100 }
    var ft: Length { return self / 3.2808}
}

let runingDistance: Length = 3.54.km

typealias AudioSample = UInt32

//--------协议中使用别名 要用 associatedtype

//协议 于 别名使用的情况
protocol WeightCalculable {
    associatedtype weightType
    var weight: weightType { get }
}

class iPhone7: WeightCalculable {
    typealias weightType = Double
    var weight: weightType {
        return 0.0114
    }
  
}

class Ship: WeightCalculable {
    typealias weightType = Int
    var weight: weightType
    init(weight: Int) {
        self.weight = weight
    }
}

// 对int 做一个扩展 t代表吨，。t相当于*1000
extension Int {
    typealias weight = Int
    var t: weight { return self * 1_000 }
}

let titanic = Ship(weight: 46_328.t)


//MARK---标准库中的常用协议: 比较协议Equatable、 比较大小Comparable, 打印协议 CustomStringConvertible

struct Record: Equatable, Comparable, CustomStringConvertible, BooleanLiteralType {
  
    var wins: Int
    var losses: Int
    
    static func < (lhs: Record, rhs: Record) -> Bool {
        if lhs.wins != rhs.wins {
            return lhs.wins < rhs.wins
        }
        
        return lhs.losses > rhs.losses
    }

    var description: String {
           return "x Win:" + "\(self.wins)" + "Loss:" + "\(self.losses)"
       }
    
    var boolValue: Bool {
        return wins > losses
    }
}

let recordA = Record(wins: 10, losses: 10)
let recordB = Record(wins: 13, losses: 10)
let recordC = Record(wins: 11, losses: 9)

var records = [recordA, recordB, recordC]
recordA == recordB
recordA != recordB


recordB > recordA
recordB < recordA

records.sort(by: >)

print(recordA)

if recordC {
    print("wins")
}
