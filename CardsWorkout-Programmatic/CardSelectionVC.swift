//
//  CardSelectionVC.swift
//  CardsWorkout-Programmatic
//
//  Created by Yulian Gyuroff on 30.04.23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(color: .systemRed, title: "Stop!",systemImageName: "stop.circle")
    let resetButton = CWButton(color: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise")
    let rulesButton = CWButton(color: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    
    var cards: [UIImage] = CardDeck.allValues
    var timer: Timer!
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
 
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false // use Autolayout for the view
        cardImageView.image = UIImage(named: "AS")
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
          ])
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
        rulesButton.addTarget(self, action: #selector(presentRulesVC) , for: .touchUpInside)
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
}
