import UIKit

protocol Prizable {
    func isPeizable() -> Bool
}

struct student: CustomStringConvertible, Comparable, Equatable, Prizable {
       var name: String
       var score: Int
       var description: String{
           return name + "Score" + "\(score)"
       }
    static func < (lhs: student, rhs: student) -> Bool {
        return lhs.score > rhs.score
    }
    
    func isPeizable() -> Bool {
        return score > 60
    }
    
   
}

let a = student(name: "aaa", score: 58)
let b = student(name: "bbb", score: 78)
let c = student(name: "ccc", score: 90)

let students = [a, b, c]


func topOne<T: Comparable>(sep:[T] ) -> T {
    assert(sep.count > 0)
    
    return sep.reduce(sep[0]) { max( $0 , $1 ) }
}

topOne(sep: students)

let sss = [1, 2, 23, 4, 55, 6]
let ss = sss.filter{ $0 > 40 }
print(ss)

let sts = students.filter { (student) -> Bool in
    student.isPeizable()
}

print(sts)
let st1 = sts[0]
print(st1.name)


// MARK UiKit中的委托

protocol TrunBase {
    var turn: Int {get set}
    func play()
}

protocol PlayingDelegate {
    func starPlay()
    func contunesPlay()
    func endPaly() -> Bool
}

class singlePlayerGame: TrunBase {
    var turn: Int = 0
    var delegate: PlayingDelegate!
    func play() {
        delegate.starPlay()
        
        while !delegate.endPaly() {
            delegate.contunesPlay()
            turn += 1
        }
        delegate.endPaly()
    }
}

class bassketball: singlePlayerGame, PlayingDelegate {
    var scour: Int = 0
    
    override init() {
        super.init()
        delegate  = self
    }
    func starPlay() {
        scour = 0
        turn = 0
        
        print("开始游戏")
    }
    
    func contunesPlay() {
        scour += Int(arc4random())%6 + 1
        print("\(turn)继续🤩\(scour)")
    }
    
    func endPaly() -> Bool {
        if scour > 99 {
            print("结束游戏")
            return true
        }
        print("没有结束")
        return false
    }
    
    
}


let baseket = bassketball()
baseket.play()



