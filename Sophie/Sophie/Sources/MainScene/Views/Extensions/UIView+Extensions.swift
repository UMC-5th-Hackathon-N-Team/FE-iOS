//
//  UIView+Extensions.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

extension UIView {
    
    func configureCornerRadius(_ clipsToBounds: Bool, cornerRadius: CGFloat) {
        self.clipsToBounds = clipsToBounds
        layer.cornerRadius = cornerRadius
    }
    
    func configureShadow(
        _ masksToBounds: Bool,
        shadowColor: UIColor,
        shadowOffset: CGSize,
        shadowOpacity: Float,
        shadowRadius: CGFloat
    ) {
        layer.masksToBounds = masksToBounds
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
}
