//
//  ViewController.swift
//  tips
//
//  Created by Luu Tien Thanh on 6/30/16.
//  Copyright © 2016 Thanh Luu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var value1 = Int()
    var value2 = Int()
    var value3 = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        //self.billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.billField.becomeFirstResponder()
    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        value1 = defaults.integerForKey("value_1")
        value2 = defaults.integerForKey("value_2")
        value3 = defaults.integerForKey("value_3")
        defaults.synchronize()
        tipControl.setTitle(String(format: "%d%%", value1), forSegmentAtIndex: 0)
        tipControl.setTitle(String(format: "%d%%", value2), forSegmentAtIndex: 1)
        tipControl.setTitle(String(format: "%d%%", value3), forSegmentAtIndex: 2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
    
        var tipPercentages = [Double(value1)/100, Double(value2)/100, Double(value3)/100]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
    
//        tipLabel.text = "$\(tip)"
//        totalLabel.text = "$\(total)"

//        tipLabel.text = String(format: "$%.2f", tip)
//        totalLabel.text = String(format: "$%.2f", total)
        
        let formatter = NSNumberFormatter()
        
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale() // This is the default
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

