//
//  ExerciseViewController.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 11/16/23.
//

import UIKit

class ExerciseViewController : UIViewController {
    
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerView()
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
