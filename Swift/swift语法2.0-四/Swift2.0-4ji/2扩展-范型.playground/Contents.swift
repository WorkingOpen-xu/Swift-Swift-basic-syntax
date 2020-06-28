import UIKit
//
//// 扩展基础
//struct Point {
//    var x = 0.0
//    var y = 0.0
//}
//
//struct Size {
//    var width = 0.0
//    var height = 0.0
//}
//
//class Rectangle {
//
//var origin = Point()
//var size = Size()
//
//init(origin: Point, size: Size) {
//    self.origin = origin
//    self.size = size
//}
//
//}
//
//extension Rectangle {
//    func translate(x:Double, y: Double) {
//        self.origin.x += x
//        self.origin.y += y
//    }
//}
//
//extension Rectangle {
//
//    var center : Point {
//        get {
//            let centerX = ( origin.x + size.width ) / 2
//            let centerY = ( origin.y + size.height ) / 2
//
//            return Point(x: centerX, y: centerY)
//        }
//
//        set(newCenter) {
//            origin.x = newCenter.x - size.width/2
//            origin.y = newCenter.y - size.height/2
//        }
//    }
//
//    convenience init(center: Point, size: Size) {
//        let originX = center.x - size.width/2
//        let originy = center.y - size.height/2
//        self.init(origin:Point(x: originX, y: originy), size: Size(width: size.width, height: size.height))
//
//    }
//}
//
//var rect = Rectangle(origin: Point(x:1.1, y: 1.2), size: Size(width:12, height: 17))
//
//rect.center = Point(x: 20, y: 49)
//
//
////MARK  --- 嵌套类型 枚举、下标
class UIs {
    enum Theme{
        case DayMode
        case NighMode
    }
    
    
}

extension UIs{
//    public typeallias day = Theme.DayMode
//    public typeallias night = Theme.NighMode
}

var dd = UIs.Theme.DayMode
var nn = UIs.Theme.NighMode

//MARK ---扩展系统类型

extension Int{
    var square: Int {
        return self * self
    }
    
    var cube: Int {
        return self * self * self
    }

    //循环执行
    func repetitions( task: () -> Void){
        for _ in 0..<self {
            task()
        }
    }
    func repectine(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    func inRange(closeLeft: Int, openedRight: Int) -> Bool {
        return self > closeLeft && self < openedRight
    }
    
    //一直相加by 到end结束
//    func stride(end: Int, by: Int, task: (Int)) -> Int {
//        
//        for i in self.stride(to:end, by: stride) {
//            task(i)
//        }
//        
//    }
}
    


var num = 3
num = num.square
num.inRange(closeLeft: 1, openedRight: 20)
num.repetitions{
    print(123)
}
//num.stride(end: 8, by: 2){index in
//
//    print(index)
//}


for i in 20.stride(through: num, by: -3) {
    print(i)
}
