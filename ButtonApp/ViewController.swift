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
        
        // Button Pressed Print result
        print("spank me daddy")
        
        // Update Score
        score += 1
        
        // Update Label
        numberView.text = String(score)
        defaults.set(score, forKey: "counterKey")
        
        // Play Sound
        audioPlayer.play()

    }
    
}

