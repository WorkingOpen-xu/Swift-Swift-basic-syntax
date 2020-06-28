import UIKit

var arr = [0,1,2,3]
var dict = ["北京":"beijing","纽约":"New York","巴黎":"Paris"]
arr[2]
dict["北京"]

struct Vector3 {
    var x:Double = 0.0
    var y:Double = 0.0
    var z:Double = 0.0
    
    func length() -> Double {
        return sqrt(x * x + y * y + z * z)
    }
    
    subscript(index: Int) -> Double? {
        get {
            switch index {
            case 0: return x
            case 1: return y
            case 2: return z
            default: return nil
            }
        }
        
        set {
            guard let newValue = newValue else { return }
            switch index {
            case 0: x = newValue
            case 1: y = newValue
            case 2: z = newValue
            default: return
            }
        }
    }
    
    subscript(axis: String) -> Double? {
        get {
            switch axis {
            case "x", "X": return x
            case "y", "Y": return y
            case "z", "Z": return z
            default: return nil
            }
            }
        set {
        guard let newValue = newValue else { return }
            switch axis {
                 case "x", "X": x = newValue
                 case "y", "Y": y = newValue
                 case "z", "Z": z = newValue
                 default: return
            }
        }
    }
}

//创建新的Vector3
var v = Vector3(x: 0.1, y: 0.3, z: 0.4)

//下标获取值
var v1 = v[1]
var v2 = v[2]
var v3 = v[3]

var v11 = v["x"]
var v22 = v["Y"]

//下标重置值
v[1] = 0.11

v["x"] = 0.33

//---------------------------------------------------
// MARK  2-2多维下标
struct Matrix {
var data:[[Double]]
let r:Int
let c:Int

init(row: Int, col: Int) {
    self.r = row
    self.c = col
    data = [[Double]]()
    for _ in 0..<r {
        let aRow = Array(repeating: 0.1, count: col)
        data.append(aRow)
    }
    
   
}
    subscript(x: Int, y: Int) -> Double {
           
           get {
               assert(x >= 0 && x < r
               && y >= 0 && y < c, "数组越界了")
               return data[x][y]
           }
           
           set {
               assert(x >= 0 && x < r
               && y >= 0 && y < c, "数组越界了")
               data[x][y] = newValue
           }
       }
    
    
    subscript(row: Int) -> [Double] {
        get {
            assert(row >= 0 && row < r ,"数组又越界了")
            return data[row]
        }
        set (vector){
            assert(vector.count == c ,"数组个数不匹配")
            data[row] = vector
        }
    }

}
var m = Matrix(row: 2, col: 2)
m[1,1]
m[1,1] = 100.0

m[1] = [1,2]
m[1][1]



//MARK 2-3----- 运算符重载 --

func + (left: Vector3, right: Vector3) -> Vector3 {
    return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
}

var left = Vector3(x: 1.1, y: 1.2, z: 3)
var right = Vector3(x: 1.1, y: 1.2, z: 3)

left + right

//--------

func - (left: Vector3, right: Vector3) -> Vector3 {
    return Vector3(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z)
}

right - left

//--------

func * (left: Vector3, right: Vector3) -> Double {
    return left.x * right.x + left.y * right.y + left.z * right.z
}

func * (left: Vector3, a: Double) -> Vector3 {
    return Vector3(x: left.x * a, y: left.y * a, z: left.z * a)
}

left * right

left * 1.1

// 求相反向量    inout 用一个函数改变 外部变量的值
left * -1.0


//--------
func += (left: inout Vector3, right: Vector3) {
    left = left + right
}

func -= (left: inout Vector3, right: Vector3) {
    left = left - right
}


// MARK ---- 重载 比较运算符

let va = Vector3(x: 2.1, y: 2.2, z: 2.3)
let vb = Vector3(x: 2.1, y: 2.3, z: 2.3)

func == (left: Vector3, right: Vector3) -> Bool {
    return left.x == right.x && left.y == right.y && left.z == right.z
}
va == vb

func != (left: Vector3, right: Vector3) -> Bool {
    return left.x != right.x || left.y != right.y || left.z != right.z
}

va != vb

//func < (left: Vector3, right: Vector3) -> Bool {
//
//}
//-------

var a = [1,3,4,5,2,6,9,7]

//sort 排序， by：> 从大到小排序
a.sort(by: >)


//MARK 自定义运算符。/，=，-，=，！，*，%，，< , >，&，｜，^，or

// a ++

postfix operator +++
prefix operator +++
prefix func +++ (vector: inout Vector3) -> Vector3{
    vector += Vector3(x: 1, y: 1, z: 1)
    return vector
}
postfix func +++ (vector: inout Vector3) -> Vector3 {
    vector += Vector3(x: 1, y: 1, z: 1)
    return vector
}

var postV1 = Vector3(x: 2, y: 2, z: 2)
 +++postV1
postV1+++


//  双目运算符
infix operator ^
func ^(left:Vector3, right:Vector3) -> Double {
    return acos((left * right) / (left.length() * right.length()))
}

let vb2 = Vector3(x: 4.0, y: 5.0, z: -6.0)

va ^ vb2

//结合性。优先级

infix operator ** {associativity left precedence 101}
func ** (left: Int, right:Int) -> Int {
    return left * right
}

3**4**5

