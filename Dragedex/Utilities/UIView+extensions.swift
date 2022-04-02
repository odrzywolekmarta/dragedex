//
//  UIView+extensions.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

extension UIView {
    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
    }
}

extension UIImageView {
    func makeRound() {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}
