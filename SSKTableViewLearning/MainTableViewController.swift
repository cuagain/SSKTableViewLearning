//
//  MainTableViewController.swift
//  SSKTableViewLearning
//
//  Created by Thanawat Soisakhoo on 11/11/2557 BE.
//  Copyright (c) 2557 Thanawat Soisakhoo. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var sectionData: JSON = JSON.nullJSON
    var isLoaded = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
                
        //println(self.sectionData.count)
        //println("viewDidLoad")
        //println(self.sectionData.count)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if !self.isLoaded  {
            let mainStoryboard = self.storyboard!
            let myLaunchScreen = mainStoryboard.instantiateViewControllerWithIdentifier("MyLaunchScreen") as UIViewController
            
            //self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            //self.providesPresentationContextTransitionStyle = true
            self.presentViewController(myLaunchScreen, animated: false, completion: {})
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        
        println(self.sectionData[0])
        
        switch self.sectionData.type {
            case Type.Array, Type.Dictionary:
                return self.sectionData.count
            default:
                return 1
        }
        
        //return 0;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        switch self.sectionData[section]["articles"].type {
            case Type.Array, Type.Dictionary:
                return self.sectionData[section]["articles"].count
            default:
                return 0
        }
        
        
        //return 0;
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        println("Section \(section)")
        
        switch self.sectionData[section].type {
            case Type.Array, Type.Dictionary:
                return self.sectionData[section]["title"].stringValue
            default:
                return ""
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("JSONCell", forIndexPath: indexPath) as UITableViewCell
        
        var row = indexPath.row
        let section = indexPath.section
        
        switch self.sectionData[section]["articles"].type {
            case .Array:
                cell.textLabel.text = self.sectionData[section]["articles"][row]["title"].stringValue
                //cell.detailTextLabel?.text = self.sectionData[section]["articles"]["title"].stringValue
            case .Dictionary:
                let key: AnyObject = (self.sectionData.object as NSDictionary).allKeys[row]
                let value = self.sectionData[key as String]
                //cell.textLabel.text = "\(key)"
                //cell.detailTextLabel?.text = value.description
            default:
                cell.textLabel.text = ""
                //cell.detailTextLabel?.text = self.sectionData.description
        }

        return cell
    }
    

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
