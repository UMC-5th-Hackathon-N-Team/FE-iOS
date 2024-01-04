//
//  UIStackView+Extensions.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

extension UIStackView {
    
    func configureStackView(
        alignment: Alignment,
        axis: NSLayoutConstraint.Axis,
        distribution: Distribution,
        spacing: CGFloat?
    ) {
        self.alignment = alignment
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing ?? 0
    }
    
}
