//
//  ViewController.swift
//  RoshanTimer
//
//  Created by jan on 4/14/19.
//  Copyright © 2019 jan. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

  var seconds = 660;
  var timer = Timer();
  var isTimerRunning = false;
  let soundEffect = URL(fileURLWithPath: Bundle.main.path(forResource: "Roshan_Death", ofType: "wav")!)
  var audioPlayer = AVAudioPlayer()
  
  
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
      AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
  }

  @IBAction func resetButtonTapped(_ sender: Any) {
    confirmReset();
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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    roshStatusLabel?.text = "ROSHAN IS UP!"
    miniRoshan.image = UIImage(named: "redRosh")
    for button in Buttons {
      button.layer.cornerRadius = 8;
    }
  }
}

