//
//  AudioController.swift
//  RoshanTimer
//
//  Created by jan on 4/14/19.
//  Copyright © 2019 jan. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


extension ViewController {
  func playSound(){
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: soundEffect)
      audioPlayer.play()
    } catch {
      print("sound failed")
    }
  }
}

