//
//  HomeViewController.swift
//  firstSwiftProject
//
//  Created by huweidong on 10/5/16.
//  Copyright © 2016年 huweidong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //moveByX为变异方法用于修改结构体里面的值
    struct Point {
        var x=0.0,y=0.0
        mutating func moveByX(deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
            }
        }
    
    //自定义下标
    struct Matrix {
        let rows: Int, columns: Int
        var grid: [Double]
        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
            grid = Array(count: rows * columns, repeatedValue: 0.0)
        }
        func indexIsValidForRow(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }
        subscript(row: Int, column: Int) -> Double {
            get {
                assert(indexIsValidForRow(row, column: column), "Index out of range")
                return grid[(row * columns) + column]
            }
            set {
                assert(indexIsValidForRow(row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveByX(2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
        
        // Do any additional setup after loading the view.
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // Prints "5"
        
        let customerProvider = { customersInLine.removeAtIndex(0) }
        print(customersInLine.count)
        // Prints "5"
        
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)
        // Prints "4"
        
        serveCustomer( { customersInLine.removeAtIndex(0) } )
        // Prints "Now serving Alex!"
        serveCustomer1(customersInLine.removeAtIndex(0))
        // Prints "Now serving Ewa!
        
        collectCustomerProviders(customersInLine.removeAtIndex(0))
        collectCustomerProviders(customersInLine.removeAtIndex(0))
        
        print("Collected \(customerProviders.count) closures.")
        // Prints "Collected 2 closures."
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        // Prints "Now serving Barry!"
        // Prints "Now serving Daniella!"
        
        
        //属性监测
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360
        // Added 160 steps
        stepCounter.totalSteps = 896
        // About to set totalSteps to 896
        // Added 536 steps
    }
    
    func serveCustomer(customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    
    func serveCustomer1(@autoclosure customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    
    var customerProviders: [() -> String] = []
    func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
        customerProviders.append(customerProvider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class StepCounter {
        init(){
            myColor = UIColor.clearColor()
        }
        var myColor : UIColor
        var totalSteps: Int = 0 {
            willSet(newTotalSteps) {
                print("About to set totalSteps to \(newTotalSteps)")
            }
            didSet {
                if totalSteps > oldValue  {
                    print("Added \(totalSteps - oldValue) steps")
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
