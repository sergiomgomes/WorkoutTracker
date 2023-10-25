//
//  ExerciseImageView.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/25/23.
//

import UIKit

class ExerciseImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
