import UIKit

protocol Record {
    var win: Int {get set}
    var loss: Int {get set}

    //比赛场次
    func wholeRecord() -> Int
}

protocol PingJu {
    var ping: Int {get set}
}

extension Record{
    func wholeRecord () -> Int {
        return win + loss
    }
}

extension Record where Self: PingJu {
    func wholeRecord () -> Int {
        return win + loss + ping
    }
}

struct Basketball: Record, PingJu {
    var ping: Int
    
    var win: Int
    
    var loss: Int
    
}


struct FooterBall: Record {
    var win: Int
    
    var loss: Int

}


let bass = Basketball(ping: 1, win: 23, loss: 3)
bass.wholeRecord()

let foot = FooterBall(win: 13, loss: 22)
foot.wholeRecord()
