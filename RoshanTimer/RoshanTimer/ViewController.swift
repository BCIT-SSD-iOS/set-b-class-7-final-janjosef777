//
//  ViewController.swift
//  RoshanTimer
//
//  Created by jan on 4/14/19.
//  Copyright © 2019 jan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  
  var seconds = 660;
  var timer = Timer();
  var isTimerRunning = false;
  
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var miniRoshan: UIImageView!
  @IBOutlet weak var roshStatusLabel: UILabel!
  
  @IBOutlet var Buttons: [UIButton]!
  
  @IBAction func startButtonTapped(_ sender: UIButton) {
    sender.shake();
    if (isTimerRunning == false){
      playSound();
      runTimer();
      miniRoshan.image = UIImage(named: "blueRosh")
    }
  }
  
  func confirmReset() {
    let alert = UIAlertController(title: "Reset", message: "Are you sure you want to reset the timer?", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
      self.resetTimer();
    }))
    alert.addAction(UIAlertAction(title: "NO", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
    }))
    self.present(alert, animated: true, completion:  nil)
  }
  
  @IBAction func resetButtonTapped(_ sender: Any) {
    confirmReset();
  }
  
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
  
  
  let soundEffect = URL(fileURLWithPath: Bundle.main.path(forResource: "Roshan_Death", ofType: "wav")!)
  var audioPlayer = AVAudioPlayer()
  
  func playSound(){
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: soundEffect)
      audioPlayer.play()
    } catch {
      // couldn't load file :(
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    roshStatusLabel?.text = "ROSHAN IS UP!"
    miniRoshan.image = UIImage(named: "redRosh")
    for button in Buttons {
      button.layer.cornerRadius = 8;
    }
    // Do any additional setup after loading the view, typically from a nib.
  }


}

