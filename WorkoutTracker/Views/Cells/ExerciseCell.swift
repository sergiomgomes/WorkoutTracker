//
//  ExerciseViewCell.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/25/23.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    static let reuseId = "ExerciseCell"
    let exerciseImageView = ExerciseImageView(frame: .zero)
    let exerciseNameLabel = WTLabel(textAlignment: .left, fontSize: 26)
    let exerciseTypeLabel = WTLabel(textAlignment: .left, fontSize: 18)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(exercise: Exercise){
        //TODO: implement
    }
    
    private func configure() {
        self.addSubviews(exerciseImageView, exerciseNameLabel, exerciseTypeLabel)
        
        NSLayoutConstraint.activate([
            exerciseImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            exerciseImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            exerciseImageView.heightAnchor.constraint(equalToConstant: 60),
            exerciseImageView.widthAnchor.constraint(equalToConstant: 60),
            
            exerciseNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            exerciseNameLabel.leadingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor, constant: 24),
            exerciseNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            exerciseNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            //exerciseTypeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            exerciseTypeLabel.topAnchor.constraint(equalTo: exerciseNameLabel.bottomAnchor, constant: 24),
            exerciseTypeLabel.leadingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor, constant: 24),
            exerciseTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            exerciseTypeLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
}
