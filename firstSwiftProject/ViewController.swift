//
//  ViewController.swift
//  firstSwiftProject
//
//  Created by huweidong on 8/3/16.
//  Copyright © 2016年 huweidong. All rights reserved.
 //

import UIKit

//定义一个泛型栈
struct Stack<Element1> {
    var items = [Element1]()
    mutating func push(item: Element1) {
        items.append(item)
    }
    mutating func pop() -> Element1 {
        return items.removeLast()
    }
}

//接口
protocol PeopleProtocol: NSObjectProtocol{
    var myName:String{get set}//表示属性可读可写
    func getName()->String
}

//重载加法运算符
struct Vector2D {
    var x = 0.0, y = 0.0
}
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

class ViewController: UIViewController, PeopleProtocol{
    weak var delegate: PeopleProtocol?
    
    var myTableVC:foundTable=foundTable(nibName: "foundTable", bundle: nil)
    
    var myName: String = ""
    func getName() -> String {
        return "echo"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //可选变量-表示可以为空
        var str:String?="echo"
        
        self.delegate=self
        if delegate != nil {
            print(delegate!.getName())
        }
        
        let myData:NSData=str!.dataUsingEncoding(NSUTF8StringEncoding,allowLossyConversion: true)!
        let bast64Data=myData .base64EncodedDataWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        var bast64Str:NSString=NSString(data: bast64Data, encoding: NSUTF8StringEncoding)!
        //  使用 ! 时要确定可选值不为空才可使用，否则会报错
        str=str!+"1"
        bast64Str="bast64Str="+(bast64Str as String)
        print(str!)
        print(myData)
        print(bast64Str)
        if str=="echo1"{
            print("相等")
        }
        var arr=[1,1,3,4]
        arr.append(5)
//        for index in arr{
//            print(index)
//        }
//        for var i=0; i<arr.count ;i++ {
//            print(i)
//        }
        
        str=nil
        
        sayHi()
        myTableVC.name="echo"
        var(a,b)=getNum("aa")
        a += 1
        b += 1
        
        let str1=OtherFun.HelloWorld("111")
        print(str1)
        
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        let anotherPoint = (random(), random())
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        
        switch anotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        
        //let integerToDescribe = 5
        let integerToDescribe = arc4random()%20
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        } 
        print("description=\(description)")
        
        //swift2.0以默认数组的赋值为拷贝
        var a1 = [1, 2, 3]
        var b1 = a1
        var c1 = a1
        a1[0] = 42
        print(a1[0])
        print(b1[0])
        print(c1[0])
        
        
        var arr11=["",1,2]
        arr11[0]="11"
        
        //检查可选值
        let possibleString: String? = "An optional string."
        let assumedString: String! = "An implicitly unwrapped optional string."
        if let definiteString = assumedString {
            print(definiteString)
        }
        if possibleString != nil {
            print(possibleString)
        }
        let age = -3
        assert(age != 2,"22222")
        
        do{
            try canThrowAnError()
            var someInt = 3
            var anotherInt = 107
            swapTwoInts(&someInt, &anotherInt)
            print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
            // Prints "someInt is now 107, and anotherInt is now 3"
        }catch{
            
        }
        
    }
    
    func swapTwoInts(inout a: Int, inout _ b: Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func canThrowAnError() throws {
        // this function may or may not throw an error
        let defaultColorName = "red"
        var userDefinedColorName: String?   // defaults to nil
        userDefinedColorName="white"
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        print(colorNameToUse)
        
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
        
        //let shoppingList=[String](count: 3, repeatedValue: "233333")
        let shoppingList: [String] = ["Eggs", "Milk"]
        let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        let airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        print(shoppingList)
        print(favoriteGenres)
        print(airports)
        
        let index: Int=0
        for _ in index ..<  3 {
            print("index is \(index)")
        }
    }
    
    func printLog(string:String) -> Void {
        //不确定有多少参数函数定义
        func arithmeticMean(numbers: Double...) -> Double {
            var total: Double = 0
            for number in numbers {
                total += number
            }
            return total / Double(numbers.count)
        }
        arithmeticMean(1, 2, 3, 4, 5)
        // returns 3.0, which is the arithmetic mean of these five numbers
        arithmeticMean(3, 8.25, 18.75)
        // returns 10.0, which is the arithmetic mean of these three numbers
        print("string=\(string)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getNum(name:String)->(Int,Int){
        return (2,3)
    }

    @IBAction func btnClick(sender: AnyObject) {
        myTableVC.modalTransitionStyle=UIModalTransitionStyle.PartialCurl
        //self.presentViewController(myTableVC, animated: true, completion: nil)
        //let nav:UINavigationController=UINavigationController(rootViewController: myTableVC))
        //self.navigationController?.pushViewController(myTableVC, animated: true)
        
        myTableVC.myPrintLog=printLog
        
        self.presentViewController(myTableVC, animated: true, completion: nil)
    }
    
}


//接口的实现
//class Men:People {
//    var myName: String = ""
//    func getName() -> String {
//        return "echo"
//    }
//}
//类拓展
extension ViewController{
    func sayHi(){
        let str="6666"
        print("Hi boy!\(str)")
    }
}
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

extension Int{
    func absoluteValue() -> Int {
        return 0;
    }
}

