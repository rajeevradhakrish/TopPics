//
//  UIView+Ext.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 06/11/22.
//

import Foundation
import UIKit

extension UIView {
        
    func setRoundedCornerRadius() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
    }
    func setCustomRoundedCornerRadius(value:CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
        self.layer.cornerCurve = .continuous
    }
    func setBorderWidth(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        //self.clipsToBounds = true
    }
    
}

