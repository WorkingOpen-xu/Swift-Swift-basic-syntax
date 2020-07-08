import UIKit

//发生错误 停止程序。debug模式 使用
assert(1 > 0 , "不可呢的错误")
assertionFailure("出错了")
precondition(1>0, "也是一个错")
fatalError()


//ErrorType
//1 描述错误使用枚举
