//
//  ViewController.swift
//  stopper
//
//  Created by Sipos Péter on 2018. 12. 30..
//  Copyright © 2018. Sipos Péter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        stopButton.isEnabled = false
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var counter = 00.00
    var timer = Timer()
    var isPlaying = false
    
    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.00
        timeLabel.text = String(counter)
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.01
        timeLabel.text = String(format: "%.01f", counter)
    }
}

