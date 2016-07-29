//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Kurt Staufenberg on 7/27/16.
//  Copyright © 2016 Kurt Staufenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UIBarButtonItem!
    @IBOutlet weak var computerScoreLabel: UIBarButtonItem!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    let names = [ "🗿", "📄", "✂️" ]
    var playerMove = -1
    var computerMove = -1
    var playerScore = 0
    var computerScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupButtons() {
        // Makes it so the score labels can't be tapped
        playerScoreLabel.enabled = false
        computerScoreLabel.enabled = false
        // Add the target for the buttons when they're pressed
        rockButton.addTarget(self, action: #selector(moveButtonPressed), forControlEvents: .TouchUpInside)
        paperButton.addTarget(self, action: #selector(moveButtonPressed), forControlEvents: .TouchUpInside)
        scissorsButton.addTarget(self, action: #selector(moveButtonPressed), forControlEvents: .TouchUpInside)
        // Change the size of the font of the labels
        playerLabel.font = playerLabel.font.fontWithSize(48)
        computerLabel.font = computerLabel.font.fontWithSize(48)
        rockButton.titleLabel!.font = rockButton.titleLabel!.font.fontWithSize(36)
        paperButton.titleLabel!.font = rockButton.titleLabel!.font.fontWithSize(36)
        scissorsButton.titleLabel!.font = rockButton.titleLabel!.font.fontWithSize(36)
    }
    
    // MARK: Actions
    @IBAction func moveButtonPressed(sender: UIButton) {
        if sender === rockButton {
            playerMove = 0
        }
        else if sender === paperButton {
            playerMove = 1
        }
        else if sender === scissorsButton {
            playerMove = 2
        }
        computerMakeMove()
        calculateNewScore()
        playerLabel.text = names[playerMove]
        computerLabel.text = names[computerMove]
    }

    // When a button is pressed with the player's score, this function calculates what the computer will do
    func computerMakeMove() {
        computerMove = Int(arc4random_uniform(3))
    }
    
    // Called when both the player and the computer have made a move, updates the new scores and their labels
    func calculateNewScore() {
        let winner = (3 + playerMove - computerMove) % 3
        if winner == 1 { playerScore += 1 }
        else if winner == 2 { computerScore += 1 }
        playerScoreLabel.title = "You: \(playerScore)"
        computerScoreLabel.title = "Computer: \(computerScore)"
    }


}

