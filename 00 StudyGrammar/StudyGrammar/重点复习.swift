//
//  重点复习.swift
//  StudyGrammar
//
//  Created by 张晶 on 2019/1/17.
//  Copyright © 2019 Apress. All rights reserved.
//

import Foundation

/*
 使用？？来给nil情况设置默认值
 */
//        var a = ["a":"x","b":"y"]
//        var c = a["c"] ?? "z"
//        print(c)


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


/*
 associatedtype 泛型相关的绑定类型
 where语句是跟在参数(也许还有返回值)后面的语句，用来约束参数的
 */
// Container 协议
//protocol Container {
//    associatedtype ItemType1
//    // 添加一个新元素到容器里
//    mutating func append(_ item: ItemType1)
//    // 获取容器中元素的数
//    var count: Int { get }
//    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
//    subscript(i: Int) -> ItemType1 { get }
//}
//// Stack 结构体遵从 Container 协议
//struct Stack<Element>: Container {
//    // Stack<Element> 的原始实现部分
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//    // Container 协议的实现部分
//    mutating func append(_ item: Element) {
//        self.push(item)
//    }
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//}


/*
 可以在一个单独的文件中，不定义class，直接定义func，这样，就是全局func了，例如TextShooter里面的vectorMultiply()等方法
 */



