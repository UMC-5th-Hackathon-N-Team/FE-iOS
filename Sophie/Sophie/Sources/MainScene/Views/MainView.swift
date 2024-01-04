//
//  MainView.swift
//  Sophie
//
//  Created by Rafael on 1/4/24.
//

import UIKit

import SnapKit
import Then

class MainView: UIView {

    let mainIconImageView = UIImageView().then {
        $0.image = UIImage(named: "mainIcon")
        $0.contentMode = .scaleAspectFit
    }
    
}
