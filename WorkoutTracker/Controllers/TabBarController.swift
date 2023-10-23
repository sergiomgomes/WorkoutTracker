//
//  TabBarController.swift
//  WorkoutTracker
//
//  Created by Sergio Gomes on 10/23/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .black
        
        viewControllers = [createWorkoutNavigationController(), createExercisesNavigationController()]
    }
    
    func createWorkoutNavigationController() -> UINavigationController {
        let newWorkoutLabel = "New Workout"
        let workoutViewController = WorkoutViewController()
        workoutViewController.title = newWorkoutLabel
        workoutViewController.tabBarItem = UITabBarItem(title: newWorkoutLabel, image: UIImage(systemName: SFSymbols.plus), tag: 0)
        
        return UINavigationController(rootViewController: workoutViewController)
    }
    
    func createExercisesNavigationController() -> UINavigationController {
        let exercisesLabel = "Exercises"
        let exercisesViewController = ExercisesViewController()
        exercisesViewController.title = exercisesLabel
        exercisesViewController.tabBarItem = UITabBarItem(title: exercisesLabel, image: UIImage(systemName: SFSymbols.dumbbell), tag: 1)
        
        return UINavigationController(rootViewController: exercisesViewController)
    }
}
