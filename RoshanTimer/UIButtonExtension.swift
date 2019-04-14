//
//  UIButtonExtension.swift
//  RoshanTimer
//
//  Created by jan on 4/14/19.
//  Copyright © 2019 jan. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
  
  func shake() {
    let shake = CABasicAnimation(keyPath: "position")
    shake.duration = 0.1
    shake.repeatCount = 4
    shake.autoreverses = true
    
    let fromPoint = CGPoint(x: center.x - 5, y: center.y)
    let fromValue = NSValue(cgPoint: fromPoint)
    
    let toPoint = CGPoint(x: center.x + 5, y: center.y)
    let toValue = NSValue(cgPoint: toPoint)
    
    shake.fromValue = fromValue;
    shake.toValue = toValue;
    
    layer.add(shake, forKey: nil)
  }
}
