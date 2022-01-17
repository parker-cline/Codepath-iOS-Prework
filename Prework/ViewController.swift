//
//  ViewController.swift
//  Prework
//
//  Created by Parker C. on 1/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    // Access UserDefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // retrieve the default tip percentages from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let percent1 = defaults.string(forKey: "defaultPercentage1") ?? "15"
        let percent2 = defaults.string(forKey: "defaultPercentage2") ?? "18"
        let percent3 = defaults.string(forKey: "defaultPercentage3") ?? "20"
        print(percent1, percent2, percent3)
        tipControl.setTitle( percent1 + "%", forSegmentAt: 0)
        tipControl.setTitle( percent2 + "%", forSegmentAt: 1)
        tipControl.setTitle( percent3 + "%", forSegmentAt: 2)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        print(tipControl.selectedSegmentIndex)
        let bill = Double(billAmountTextField.text!) ?? 0
        
        var percent1 = defaults.double(forKey: "defaultPercentage1")
        var percent2 = defaults.double(forKey: "defaultPercentage2")
        var percent3 = defaults.double(forKey: "defaultPercentage3")
        print(percent1, percent2, percent3)
        if (percent1 == 0.0) {
            percent1 = 15.0
        }
        if (percent2 == 0.0) {
            percent2 = 18.0
        }
        if (percent3 == 0.0) {
            percent3 = 20.0
        }
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [percent1 / 100, percent2 / 100, percent3 / 100]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
    
}

