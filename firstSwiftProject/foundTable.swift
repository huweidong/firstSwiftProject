//
//  foundTable.swift
//  firstSwiftProject
//
//  Created by huweidong on 9/3/16.
//  Copyright © 2016年 huweidong. All rights reserved.
//

import UIKit

typealias printValueLog=(string:String)->Void

class foundTable: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var name:String!
    var lsitData  = ["Allen","Luc","LiLei","XiaoMing"];
    var identifier="fountTableViewCell"
    var myPrintLog:printValueLog?
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myNib:UINib=UINib.init(nibName: identifier, bundle: NSBundle.mainBundle())
        myTableView?.registerNib(myNib, forCellReuseIdentifier: identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getName()->String{
        return name
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backClick(sender: AnyObject) {
        myPrintLog!(string:"2333333")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: -UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return lsitData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//        let cellIndenttifier:String = "CellIndenttifier";
//        let cell:UITableViewCell  =  UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIndenttifier);
//        cell.textLabel!.text = lsitData[indexPath.row];
//        //圆角
//        cell.imageView!.image = UIImage(named:"avatars.jpg");
//        cell.imageView!.layer.masksToBounds = true;
//        cell.imageView!.layer.cornerRadius = 5;
//        cell.imageView!.layer.borderWidth = 2;
//        cell.imageView!.layer.borderColor = UIColor.yellowColor().CGColor;
//        cell.detailTextLabel?.text  = "hlello";
//        return cell;
        //这种方法要线注册nib
        let cell:fountTableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! fountTableViewCell
        cell.loadData()
        return cell
    }

    
    //MARK: -UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 60.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("----------")
    }
}
