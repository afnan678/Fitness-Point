//
//  GradientView.swift
//  Quotes
//
//  Created by apple on 07/12/2023.
//

import Foundation
import UIKit



@IBDesignable
class GradientView: UIView {
    
    // Define the colors for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red {
        didSet {
            updateGradient()
        }
    }
    @IBInspectable var endColor: UIColor = UIColor.yellow {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var corner: CGFloat = 0.0 {
        didSet {
            updateGradient()
        }
    }
    // Create gradient layer
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        // Set the gradient frame
        gradientLayer.frame = rect
        
        // Set the colors
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        // Gradient is linear from left to right
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        // Add gradient layer into the button
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        layer.cornerRadius = corner
        layer.masksToBounds = true
    }
}
