/*
 这样代表这个Tip的标题
 */

//这样代表被注释掉的可执行代码

import UIKit

class ViewController: UIViewController {

    
    
    func basic(){
        /*
         print第二个参数设置为""就不换行
         */
//        for x in 0...10{
//            print("\(x) ", terminator: "")
//        }
        
        /*
         is 关键词
         */
//        let d = [0:"1"]
//        if d is [Int:String] {
//            print("Yes! It Is")
//        }
        
        /*
         swift的数组有个removeRange()方法可以了解一下
         还有，数组是值，不是引用
         */
        
        
        /*
         Switch Case你想在某个case后还继续执行后面的case的话，那么添加一个fallthrough
         */
        
        /*
         类里面方法的第一个参数没有外部名称，第二个及后面的参数会自动生成与内部名称相同的外部参数名称。
         这种奇怪的代码规范是为了兼容导入到Swift中的OC方法
         */
        
        /*
         协议中可以要求实现init(),然后在遵守协议的类中，init必须required
         协议能够继承 多个 其他协议
         你可以在协议的继承列表中,通过添加class关键字,限制协议只能适配到类（class）类型。
            protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol
         Swift 支持合成多个协议，这在我们需要同时遵循多个协议时非常有用。
            func show(celebrator: Stname & Stage) {
                print("\(celebrator.name) is \(celebrator.age) years old")
            }
         */
        
        /*
         扩展可以向Swift标准库或系统框架里的任意类、结构体、枚举中添加功能，如给UIColor添加一个randomColor 在书的570页
         扩展是用在改别人库或者包啥的时候，自己写一个项目时，不会将扩展功能用到自己的类中
         */
        
        /*
         类型的每一个实例都有一个隐含属性叫做self，self 完全等同于该实例本身。
         */
    }
    
    /*
     类型约束
        func findIndex1(arr: [Equatable], valueToFind: Equatable) -> Int? {
        上面这种声明方法会报错，正确方法是下面这样
     */
//    func findIndex<T: Equatable>(arr: [T], valueToFind: T) -> Int? {
//        var index: Int?
//        for (i, value) in arr.enumerated() {
//            if (value == valueToFind) {
//                index = i
//            }
//        }
//        return index
//    }

    

    
    func aboutOptional(){
        /*
         Optional本质和String Int一样，都是一种类型，下面两种声明实际是一样的
         */
//        var optionalInteger: Int?
//        var optionalInteger1: Optional<Int>
        
        /* 一个值只要不是Optional的话，赋值成nil会报错
         */
//        var notOpt = "s"
//        notOpt = nil
        
        /*
         对一个Optional对象加?的意思，就是如果不是nil则执行，如果是nil,那系统会按照nil的方式处理，至少不会报错
         但还是别怕麻烦，一旦声明了Optional类型的对象，就严格采用if let opt = optional {}的方式处理
         ！的强制解析方式，目前在我自己编程时，还没发现一定要用的地方
         这部分由于编写代码例子有点复杂，所以略过，以后需要代码，再写。
         */
        
        /*
         使用？？来给nil情况设置默认值
         */
//        var a = ["a":"x","b":"y"]
//        var c = a["c"] ?? "z"
//        print(c)

    }

    
    
/////////////////////////////////////////////////////////////
// 数组和字典
/////////////////////////////////////////////////////////////
    func aboutArrayAndDictionary(){
        /*
         创建一个确定长度数组的方法
         */
//        let someInts = [Int](repeating: 0, count: 3)
//        let si = Array<String>(repeating: "a", count: 3)
//        let ss = Array(repeating: 0, count: 3)

        /*
         我们可以使用加法操作符（+）来合并两种已存在的相同类型数组
         */
//        let a = [1,2,3]
//        let b = [4,5,6]
//        let c = a + b
//        print(c) //输出 [1, 2, 3, 4, 5, 6]
        
        /*
         字典可以把key和value分别转成数组
         遍历字典的典型方式
         */
//        let someDict = ["k1":"v1","k3":"v3","k2":"v2"]
//        for (key,value) in someDict {
//            print("字典 key \(key) -  字典 (key, value) 对 \(value)")
//        }
        
//        for (n, x) in someDict.enumerated() {
//            print("字典 n \(n) -  字典 (key, value) 对 \(x.key) , \(x.value)")
//        }
//        for x in someDict.keys {
//            print(x)
//        }
        
        /*
         sorted的用法，以及把func当参数传递的例子
         以及闭包传递匿名func
         */
//        var arr = [1,5,63,24,84,32]
//        func sortArray(first:Int,second:Int)->Bool{
//            //无论如何24都要排在第一个
//            if first == 24 { return true }
//            if second == 24 { return false}
//            return first > second
//        }
//        let b = arr.sorted(by: sortArray) //[24, 84, 63, 32, 5, 1]
//
//        //这种叫闭包
//        let c = arr.sorted(){
//            (first:Int,second:Int) -> Bool in
//            return first < second
//        }
//
//        //这是闭包的简化写法
//        let d = arr.sorted(){ $0 < $1 }
    }

    
/////////////////////////////////////////////////////////////
// 函数 和 方法
/////////////////////////////////////////////////////////////
    /*
     内外部是一个
     外部调用时，必须
     funParName(outerAndInner: 1)
     不不不不可以
     funParName(1)
     */
//    func funParName(outerAndInner:Int){
//        print(outerAndInner)
//    }
    /*
     指定了内部和外部
    */
//    func funParName(outer inner:Int){
//        print(inner)
//    }
    

    /*
     仅指定内部，外部用_代替
     外部调用时，funParName(1)
     */
//    func funParName(_ outerAndInner:Int){
//        print(outerAndInner)
//    }
    
    
    /*
     参数的默认值
     */
//    func runFunc(z:Int = 6, a:Int, b:Int = 0){
//        print(a + b + z)
//    }
    
    /*
     下面的3个func一起是 函数类型 的示意
     */
//    func summ(a: Int, b: Int) -> Int {
//        return a + b
//    }
//    func boxer(_ sumFun:(Int, Int) -> Int){
//        print("输出结果: \(sumFun(40, 89))")
//    }
//    func runFunc(){
//        let addition: (Int, Int) -> Int = summ
//        boxer(addition)
//    }
    
    
    /*
     下面的2个func一起是 嵌套函数 以及 把函数作为返回值 的例子
     */
//    func calcDecrement(forDecrement total: Int) -> () -> Int {
//        var overallDecrement = 0
//        func decrementer() -> Int {
//            overallDecrement -= total
//            return overallDecrement
//        }
//        return decrementer
//    }
//    func runFunc(){
//        let decrem = calcDecrement(forDecrement: 30)
//        print(decrem())
//    }
    
    
    /*
     下面两个全是写类（全局）方法，区别是class定义的可以被子类重写，而static定义的不可以
     用final也可以防止重写
     */
//    class func classFun(){
//        print(1)
//    }
//    static func staticFun(){
//        print(2)
//    }
    
    
    /*
     关键是不用再调用特定的“方法”了！
     下标脚本 可以定义在类（Class）、结构体（structure）和枚举（enumeration）这些目标中，可以认为是访问对象、集合或序列的快捷方式，不需要再调用实例的特定的赋值和访问方法。
     */
    
    
    /*
     inout关键词，可以在内部改完以后，外部也生效
     说的专业点，就是 “让值传递以指针方式传递”
     */
//    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//        let temporaryA = a
//        a = b
//        b = temporaryA
//    }
    
    /*
     接上面交换Int的例子，解释泛型。如果要交换的对象类型不确定，怎么办？
     */
//    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
//        let temporaryA = a
//        a = b
//        b = temporaryA
//    }
    
/////////////////////////////////////////////////////////////
// 枚举
/////////////////////////////////////////////////////////////
    
    /*
     枚举的 相关值
     */
//    enum Student{
//        case Name(String)
//        case Mark(Int,Int,Int)
//        case Vc(ViewController)
//    }
//
//    func runFunc(){
//        var a:Student = .Name("Bill")
//        a = .Mark(98,97,95)
//        a = .Vc(self)
//        switch a {
//        case .Name(let studName):
//            print("学生的名字是: \(studName)。")
//        case .Mark(let Mark1, let Mark2, let Mark3):
//            print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
//        case .Vc(let vc):
//            print(vc.classForCoder)
//        }
//    }
    

    
/////////////////////////////////////////////////////////////
// 类和结构体
/////////////////////////////////////////////////////////////
    
    /*
     结构体和类最最最大的区别： 1.被拷贝而不是被引用 2.类可以有子类
     */
    
    
    /*
     类的计算属性 下面 area和circumference 就是计算属性，这比每次都用方法获取，要方便的多
     存储属性可以didSet willSet（监控值的变化），计算属性可以set get，不可以didSet（没意义啊，直接在set里做就好了）
     用var count: Int { get }来让一个属性只读
     */
//    class CircleClass{
//        var radius:Double = 1 {
//            didSet { // 只有存储属性可以，计算属性不行的
//                if radius < 0 {
//                    radius = oldValue
//                }
//            }
//        }
//        var area:Double{ //如果只读，可以这样简化写
//            return Double.pi * radius * radius
//        }
//        var circumference:Double{ //如果要读写，就要标准写了
//            get{
//                return 2 * Double.pi * radius
//            }
//            set{
//                radius = newValue / ( 2 * Double.pi )
//            }
//        }
//    }
    
    /*
     一般情况下，值类型的属性不能在它的实例方法中被修改。
     */
//    struct modifyStruct {
//        var avar = 1
//        func modify(){
//            avar = 2 //会报错的
//        }
//    }
    
    
/////////////////////////////////////////////////////////////
// 访问控制
/////////////////////////////////////////////////////////////
    
    /*
     swift 4 中有5种，分别是 private，fileprivate，internal，public 和 open
     internal 是默认的，在自身框架、库中可以被访问，外部不能
     open和public的区别是，public在（自身框架，自身库）外部不能被重写，而open可以
     fileprivate和private的区别是，一个是在文件内私有，另一个是在类内部私有（假设有一个文件中定义了N个类）
     */
    
    
    
    /*
     Swift为不确定类型提供了两种特殊类型别名：
     
     AnyObject可以代表任何class类型的实例。
     Any可以表示任何类型，包括方法类型（function types）。
     下面是一个典型的用法
     */
//    func anyFunc(){
//        var exampleany = [Any]()
//
//        exampleany.append(12)
//        exampleany.append(3.14159)
//        exampleany.append("Any 实例")
//        exampleany.append(self)
//
//        for item2 in exampleany {
//            switch item2 {
//            case let someInt as Int:
//                print("整型值为 \(someInt)")
//            case let someDouble as Double where someDouble > 0:
//                print("Pi 值为 \(someDouble)")
//            case let someString as String:
//                print("\(someString)")
//            case let _ as ViewController:
//                print("ViewController")
//            default:
//                print("None")
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tos = Stack<String>()
        tos.push("google")
        tos.push("runoob")
        tos.push("taobao")
        // 元素列表
        print(tos.items)
        // 元素个数
        print( tos.count)
        
    }

}

/*
 associatedtype 泛型相关的绑定类型
 where语句是跟在参数(也许还有返回值)后面的语句，用来约束参数的
 */
// Container 协议
protocol Container {
    associatedtype ItemType1
    // 添加一个新元素到容器里
    mutating func append(_ item: ItemType1)
    // 获取容器中元素的数
    var count: Int { get }
    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
    subscript(i: Int) -> ItemType1 { get }
}
// Stack 结构体遵从 Container 协议
struct Stack<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


/////////////////////////////////////////////////////////////
// 构造和析构
/////////////////////////////////////////////////////////////
/*
 构造
 */

//struct AStruct{
//    init(){
//
//    }
//    init(_ i:Int){ //值类型想引用其他构造器，直接用就好
//        self.init()
//    }
//    init?(_ j:String){ //可失败的构造器，会返回nil
//        if j.isEmpty { return nil }
//    }
//}
//class FatherClas{
//    var i = 0
//
//    init(){
//        print(i)
//    }
//    init(a:String = ""){}
//    convenience init(new:Int = 1){ //引用类型想使用其他构造器，就要用convenience
//        self.init()
//        print("aaa")
//    }
//}
//class SubClass:FatherClas{
//    deinit { //每个类只能有一个析构函数，且不能有参数
//        // 执行析构过程
//    }
//}

/*
 析构，以后优化app时可以重点研究
 主要2个知识点：
    1.什么时候会循环引用
    2.weak和unown什么时候用
 */
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) 被析构") }
//}
//
//class Apartment {
//    let number: Int
//    init(number: Int) { self.number = number }
//    var tenant: Person?
//    deinit { print("Apartment #\(number) 被析构") }
//}
//class PersonAndApartment{
//    init() {
//        // 两个变量都被初始化为nil
//        var runoob: Person?
//        var number73: Apartment?
//
//        // 赋值
//        runoob = Person(name: "Runoob")
//        number73 = Apartment(number: 73)
//
//        // 意感叹号是用来展开和访问可选变量 runoob 和 number73 中的实例
//        // 循环强引用被创建
//        // 这两行要注释掉一行，才会调用两个析构函数
//        runoob!.apartment = number73
//        number73!.tenant = runoob
//
//        // 断开 runoob 和 number73 变量所持有的强引用时，引用计数并不会降为 0，实例也不会被 ARC 销毁
//        // 注意，当你把这两个变量设为nil时，没有任何一个析构函数被调用。
//        // 强引用循环阻止了Person和Apartment类实例的销毁，并在你的应用程序中造成了内存泄漏
//        runoob = nil
//        number73 = nil
//    }
//}

