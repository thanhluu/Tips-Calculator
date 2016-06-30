//
//  SettingsViewController.swift
//  tips
//
//  Created by Luu Tien Thanh on 6/30/16.
//  Copyright © 2016 Thanh Luu. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var tfValue1: UITextField!
    @IBOutlet weak var tfValue2: UITextField!
    @IBOutlet weak var tfValue3: UITextField!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tfValue1.placeholder = String(defaults.integerForKey("value_1"))
        tfValue2.placeholder = String(defaults.integerForKey("value_2"))
        tfValue3.placeholder = String(defaults.integerForKey("value_3"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Percentage"
    }
    
//    @IBAction func tfValue1OnEditingChange(sender: AnyObject) {
//        if( nil != tfValue1.text) {
//            defaults.setInteger(Int(tfValue1.text!)!, forKey: "value_1")
//            defaults.synchronize()
//        }
//    }
//    
//    @IBAction func tfValue2OnEditingChange(sender: AnyObject) {
//        if( nil != tfValue2.text) {
//            defaults.setInteger(Int(tfValue2.text!)!, forKey: "value_2")
//            defaults.synchronize()
//        }
//    }
//    
//    @IBAction func tfValue3OnEditingChange(sender: AnyObject) {
//        if( nil != tfValue3.text) {
//            defaults.setInteger(Int(tfValue3.text!)!, forKey: "value_3")
//            defaults.synchronize()
//        }
//    }
    
    override func viewWillDisappear(animated: Bool) {
        let valueSetting1 = Int(tfValue1.text!)
        let valueSetting2 = Int(tfValue2.text!)
        let valueSetting3 = Int(tfValue3.text!)
        
        if( nil != valueSetting1) {
            defaults.setInteger(valueSetting1!, forKey: "value_1")
        }
        
        if( nil != valueSetting2) {
            defaults.setInteger(valueSetting2!, forKey: "value_2")
        }
        
        if( nil != valueSetting3) {
            defaults.setInteger(valueSetting3!, forKey: "value_3")
        }
//
//        if( nil != tfValue2.text) {
//            defaults.setInteger(Int(tfValue2.text!)!, forKey: "value_2")
//            defaults.synchronize()
//        }
//        
//        if( nil != tfValue3.text) {
//            defaults.setInteger(Int(tfValue3.text!)!, forKey: "value_3")
//            defaults.synchronize()
//        }
    }
    
}
