//
//  Gradient.swift
//  SefSensin
//
//  Created by Mehdican Büyükplevne on 5.04.2023.
//

import UIKit

class GradientImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.lightGray.cgColor, UIColor.clear.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0.0)
        gradient.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
}
