//
//  TaskLobbyTableViewController.swift
//  MewMewMoneyBox
//
//  Created by 张青明 on 15/9/2.
//  Copyright (c) 2015年 极客栈. All rights reserved.
//
//  任务大厅

import UIKit

/// 任务大厅
class TaskLobbyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - 设置UI
    func setupUI() {
        self.title = "任务大厅"
        
        var rightItem = UIBarButtonItem(title: "签到", style: UIBarButtonItemStyle.Done, target: self, action: "signIn")
        let titleTextAttributes = NSMutableDictionary()
        titleTextAttributes.setValue(UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        let font = UIFont(name: "STHeitiSC-Light", size: 13.0)
        titleTextAttributes.setValue(font, forKey: NSFontAttributeName)
        rightItem.setTitleTextAttributes(titleTextAttributes as [NSObject:AnyObject], forState: UIControlState.Normal)
        //        rightItem.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = rightItem
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "leftItem")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), style: UIBarButtonItemStyle.Done, target: self, action: "popUserInfoListViewCtrl")
    }
    
    func popUserInfoListViewCtrl()
    {
        var userInfoListVC = UIStoryboard(name: "UserInfoList", bundle: nil).instantiateInitialViewController() as! UserInfoListTableViewController
        self.presentViewController(userInfoListVC, animated: true, completion: nil)
    }
    /**
    签到
    */
    func signIn()
    {
        // TODO:
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
