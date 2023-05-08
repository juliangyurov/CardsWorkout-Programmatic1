//
//  RulesVC.swift
//  CardsWorkout-Programmatic
//
//  Created by Yulian Gyuroff on 1.05.23.
//

import UIKit

class RulesVC: UIViewController {
    
    let titleLabel = UILabel()
    let rulesLabel = UILabel()
    let exserciseLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            
        ])
    }
    
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.text = "The number of each card represents the exercise you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        rulesLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureExerciseLabel() {
        view.addSubview(exserciseLabel)
        exserciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exserciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exserciseLabel.text = "♠️ = Push-ups\n\n❤️ = Sit-ups\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
        exserciseLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            exserciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor,constant: 60),
            exserciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exserciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
