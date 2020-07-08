import UIKit

protocol Record: CustomStringConvertible {
    var win: Int {get}
    var losses: Int {get}

}

protocol tieable {
    var ties: Int { get }
}


protocol jiangli {
    func canFa() -> Bool
}

extension Record where Self: tieable {
    
    var geamPlayed: Int {
        return win + losses + ties
    }
    func winningtaaa() -> Int {
        return win * losses * ties
    }
}
//默认实现
extension Record {
    
    func shortWin() -> Int {
        return win
    }
    
    var geamPlayed: Int {
        return win + losses
    }
    
    var description: String {
        return "我这次比赛胜利了：\(win) 场，输了 \(losses)"
    }
    
    func winningtaaa() -> Int {
        return win * losses
    }
}


struct basketballRecord: Record, jiangli {
    func  canFa() -> Bool {
        return win > losses
    }
    
    var win: Int
    
    var losses: Int
    
}


struct football: Record, tieable, jiangli{
    
    func canFa() ->  Bool {
        return win > losses  && win > ties
    }
    
    var win: Int
    
    var losses: Int
    
    var ties: Int
}

struct baseballRecord : Record {
    var win: Int
    var losses: Int
    
    var geamPlayed: Int = 1623
}


let xiaoming = basketballRecord(win: 12, losses: 12)
print(xiaoming)

xiaoming.shortWin()

let zuqiu = football(win: 12, losses: 2, ties: 45)
zuqiu.geamPlayed
print(zuqiu)

zuqiu.shortWin()



if zuqiu.canFa() {
    print(zuqiu)
}

func award(one: CustomStringConvertible & jiangli) {
    if one.canFa() {
        
        print(one)
        
    } else {
        print(one)
    }
}

struct studet: jiangli, CustomStringConvertible {
    func canFa() -> Bool {
        return fenshu > 60
    }
    
    var description: String {
        return name + "kaoshi\(fenshu)"
    }
    var fenshu: Int
    var name: String
}

let xiaoxiao = studet(fenshu: 78, name: "xiaonig")

award(one: xiaoxiao)
