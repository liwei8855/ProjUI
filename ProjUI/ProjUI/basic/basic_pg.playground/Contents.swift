import UIKit
print("abc")
////函数
//func getAge() -> Int {
//    let num = 10;
//    print(Int16.min)
//    return num
//}
//
//let str = "a" //字符串
//let a: Character = "a"//字符
//
//for _ in 0...3 {
//    print("123")
//}
//
//var age = 10
//switch age {
//case 1:
//    fallthrough
//case 2:
//    print("1 2")
//default:
//    print("other")
//}
//
////元组
//let error = (404, "Not found")
//print("result code:\(error.0),message:\(error.1)")
//
////() 空元组
//
////函数
//func sum(v1: Int, v2: Int) -> Int { v1 + v2 }
//var num = 10
//func add(_ num: inout Int) { //inout函数型参改变实参的值
//    //函数内部改变函数外部数据的值
//    num = 20
//}
//add(&num) //地址传递
////传入多个参数
//func sum(_ numbers: Int...) ->Int {
//    var total = 0
//    for n in numbers {
//        total += n
//    }
//    return total
//}
//
////枚举
//enum Password {
//    case number(Int, Int, Int, Int)
//    case other
//}
//
//var pwd = Password.number(5, 6, 4, 7)
//var size = MemoryLayout<Password>.size
//var stride = MemoryLayout<Password>.stride
//var alignment = MemoryLayout<Password>.alignment
////print("size:\(size),stride:\(stride),alignment:\(alignment)")
//
//enum Season: Int {
//    case spring=1, summer, autumn, winter
//}
//
//var s = Season.spring
//
//var size1 = MemoryLayout<Season>.size
//var stride1 = MemoryLayout<Season>.stride
//var alignment1 = MemoryLayout<Season>.alignment
////print("size:\(size1),stride:\(stride1),alignment:\(alignment1)")
//
//
////关联值
////枚举成员值跟其他类型值关联存储在一起
////只能关联一个值(值、元组等)
//enum Score {
//    case points(Int)
//    case grade(Character)
//}
//var score = Score.points(96)
////score可以被修改为枚举中的任何值
////此时score是points类型，关联的96，
////在switch中可以用i接收这个值打印出来，也可以不接收
////score = .grade("A")
////此时score是grade类型，关联的值是A，可接收打印，也可不接收
//switch score {
//case let .points(i) :
//    print(i,"points")
//case let .grade(i) :
//    print("grade",i)
//}
//
//enum Date {
//    case digit(year: Int, month: Int, day: Int)
//    case string(String)
//}
//var date = Date.digit(year: 2011, month: 9, day: 10)
////date = .string("2011-09-10")
//print("date:")
//switch date {
//case .digit(let year,let month,let day):
//    print(year,month,day)
//case let .string(value):
//    print(value)
//}
////let也可以改成var
//
////如果枚举的原始值类型是int string，swift会自动分配原始值
//enum Direction: String {
//    case north = "north"
//    case south = "south"
//    case east = "east"
//    case west = "west"
//}
//print(Direction.north)
//print(Direction.north.rawValue)
////等价于
//enum Direction1:String {
//    case north, south, east, west
//}
//print(Direction1.north)
//print(Direction1.north.rawValue)
//
////递归枚举：
//indirect enum ArithExpr {
//    case number(Int)
//    case sum(ArithExpr, ArithExpr)
//    case difference(ArithExpr, ArithExpr)
//}
//
//enum ArithExpr1 {
//    case number(Int)
//    indirect case sum(ArithExpr1, ArithExpr1)
//    indirect case difference(ArithExpr1, ArithExpr1)
//}



