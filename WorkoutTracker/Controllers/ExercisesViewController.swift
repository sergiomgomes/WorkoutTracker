//
//  ExercisesViewController.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/23/23.
//

import UIKit

class ExercisesViewController: UIViewController {
    
    let tableView = UITableView()
    var exercises: [Exercise] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        getExercises()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Exercises"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.dataSource = self
        
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.reuseId)
    }
    
    private func getExercises() {
        DispatchQueue.main.async {
            NetworkManager.shared.getExercises(offset: 1, limit: 100) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let exercises):
                    self.exercises.append(contentsOf: exercises)
                case .failure(let error):
                    print("error: \(error)")
                }
            }
        }
    }

}

extension ExercisesViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.reuseId) as! ExerciseCell
        let exercise = exercises[indexPath.row]
        cell.set(exercise: exercise)
        
        return cell
    }
}
