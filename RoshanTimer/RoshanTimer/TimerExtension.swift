//
//  TimerController.swift
//  RoshanTimer
//
//  Created by jan on 4/14/19.
//  Copyright © 2019 jan. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension ViewController {
  func resetTimer(){
    timer.invalidate()
    seconds = 660;
    timerLabel.text = timeString(time: TimeInterval(seconds))
    roshStatusLabel.textColor = UIColor.red;
    miniRoshan.image = UIImage(named: "redRosh")
    roshStatusLabel?.text = "ROSHAN IS UP!"
    isTimerRunning  = false;
  }
  
  
  func runTimer (){
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    isTimerRunning = true;
  }
  
  @objc func updateTimer() {
    seconds -= 1;
    
    if (seconds == 180){
      miniRoshan.image = UIImage(named: "redRosh")
      roshStatusLabel.textColor = UIColor.yellow;
      roshStatusLabel?.text = "Roshan is maybe up!"
    }
    else if(seconds <= 1) {
      timer.invalidate()
      roshStatusLabel.textColor = UIColor.red;
      roshStatusLabel?.text = "ROSHAN IS UP!"
      AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    else {
      roshStatusLabel.textColor = UIColor.blue;
      roshStatusLabel?.text = "Roshan is dead!"
      
    }
    timerLabel.text = timeString(time: TimeInterval(seconds))
  }
  
  func timeString(time:TimeInterval) -> String {
    let hours = Int(time) / 3600
    let minutes = Int(time) / 60 % 60
    let seconds = Int(time) % 60
    return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
  }
}
