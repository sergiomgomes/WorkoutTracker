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
        configureTableView()
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
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.reuseId)
    }
    
    private func getExercises() {
        NetworkManager.shared.getExercises(offset: 1, limit: 100) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let exercises):
                self.exercises = exercises
                print("self.exercises \(self.exercises)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }

}

extension ExercisesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count \(exercises.count)")
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.reuseId) as! ExerciseCell
        let exercise = exercises[indexPath.row]
        cell.set(exercise: exercise)
        
        return cell
    }
}
