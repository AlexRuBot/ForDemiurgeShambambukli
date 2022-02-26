//
//  GradientView.swift
//  ForDemiurgeShambambukli
//
//  Created by Саша Гужавин on 26.02.2022.
//

import UIKit

class GradientView: UIView {
    
    private let gradient = CAGradientLayer()
    
    var color: [CGColor] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.addSublayer(gradient)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
        gradient.colors = color
        gradient.frame = bounds
    }
}
