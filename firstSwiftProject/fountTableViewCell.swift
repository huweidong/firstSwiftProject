//
//  fountTableViewCell.swift
//  firstSwiftProject
//
//  Created by huweidong on 9/3/16.
//  Copyright © 2016年 huweidong. All rights reserved.
//

import UIKit

class fountTableViewCell: UITableViewCell {

    @IBOutlet weak var lbText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(){
        //string转base64
        let str: String = "echo"
        let myData: NSData = str.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64: String = myData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
        NSLog("base64=%@", base64)
        
        //闭包
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        let reversed = names.sort(backwards)
        print(reversed)
        
        let str11=names.map {
            (myStr) -> String in
            let str=myStr
            print(str)
            return str
        }
        print(str11)
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        let strings = numbers.map {
            (number) -> String in
            var number = number
            var output = ""
            while number > 0 {
                output = digitNames[number % 10]! + output
                number /= 10
            }
            return output
        }
        print(strings)
    }
    
    func backwards(s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
}
