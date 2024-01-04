//
//  RoundableButton.swift
//  Sophie
//
//  Created by Rafael on 1/4/24.
//

import UIKit

class RoundableButton: UIButton {
    
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = min(frame.width, frame.height) / 2
  }
    
}
