//
//  ViewController.swift
//  ButtonApp
//
//  Created by Elliott Jungers on 5/10/18.
//  Copyright © 2018 Elliott Jungers. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
import Foundation

let calendar = Calendar.current
let now = Date()
let twopm_today = calendar.date(
    bySettingHour: 14,
    minute: 0,
    second: 0,
    of: now)!

let four_thirty_today = calendar.date(
    bySettingHour: 16,
    minute: 30,
    second: 0,
    of: now)!

class ViewController: UIViewController {

    @IBOutlet weak var numberView: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    var score = 0
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        score = defaults.integer(forKey: "counterKey")
        numberView.text = String(score)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "pointSound", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func buttonPressed(_ sender: Any) {
        
        if now >= twopm_today &&
            now <= four_thirty_today
        {

        // Button Pressed Print result
        print("button pressed")
        
        // Update Score
        score += 1
        
        // Update Label
        numberView.text = String(score)
        defaults.set(score, forKey: "counterKey")
        
        // Play Sound
        audioPlayer.play()
            
        // Lock Button
        Timer.scheduledTimer(timeInterval: 90, target: self, selector: (Selector(("enableButton"))), userInfo: nil, repeats: false)
            
        }
        else{
            print("no button press")
        }
    }
    
}

