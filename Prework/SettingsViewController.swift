//
//  SettingsViewController.swift
//  Prework
//
//  Created by Parker C. on 1/15/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var defaultTipPercentageLabel: UILabel!
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    @IBOutlet weak var tip1Box: UITextField!
    @IBOutlet weak var tip2Box: UITextField!
    @IBOutlet weak var tip3Box: UITextField!
    @IBOutlet weak var setTipButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func setDefaultTips(_ sender: Any) {
        
        let percent1 = Double(tip1Box.text!) ?? 15
        defaults.set(percent1, forKey: "defaultPercentage1")
        let percent2 = Double(tip2Box.text!) ?? 18
        defaults.set(percent2, forKey: "defaultPercentage2")
        let percent3 = Double(tip3Box.text!) ?? 20
        defaults.set(percent3, forKey: "defaultPercentage3")
        
        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
