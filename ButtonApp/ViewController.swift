//
//  ViewController.swift
//  ButtonApp
//
//  Created by Elliott Jungers on 5/10/18.
//  Copyright © 2018 Elliott Jungers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberView: UILabel!
    
    var score = 0
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score = defaults.integer(forKey: "counterKey")
        numberView.text = String(score)
        
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        // Button Pressed Print result
        print("spank me daddy")
        
        // Update Score
        score += 1
        
        // Update Label
        numberView.text = String(score)
        defaults.set(score, forKey: "counterKey")

    }
    
}

