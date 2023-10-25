//
//  UIViewExtensions.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/25/23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
