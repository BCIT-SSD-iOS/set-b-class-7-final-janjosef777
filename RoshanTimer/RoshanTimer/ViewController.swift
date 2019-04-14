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
  
  
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var miniRoshan: UIImageView!
  
  @IBOutlet weak var roshStatusLabel: UILabel!
  
  @IBAction func startButtonTapped(_ sender: Any) {
    miniRoshan.image = UIImage(named: "blueRosh")
    playSound();
    runTimer();
  }
  
  
  @IBAction func resetButtonTapped(_ sender: Any) {
    timer.invalidate()
    seconds = 660;
    timerLabel.text = timeString(time: TimeInterval(seconds))
    roshStatusLabel.textColor = UIColor.red;
    miniRoshan.image = UIImage(named: "redRosh")
    roshStatusLabel?.text = "ROSHAN IS UP!"
  }
  
  func runTimer (){
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
  }
  @objc func updateTimer() {
    seconds -= 1;
    
    if (seconds == 180){
      miniRoshan.image = UIImage(named: "redRosh")
      roshStatusLabel.textColor = UIColor.yellow;

      roshStatusLabel?.text = "Roshan is maybe up!"
    } else if(seconds == 1) {
      timer.invalidate()

      roshStatusLabel.textColor = UIColor.red;

      roshStatusLabel?.text = "ROSHAN IS UP!"
    } else {
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

    // Do any additional setup after loading the view, typically from a nib.
  }


}

