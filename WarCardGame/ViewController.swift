//
//  ViewController.swift
//  WarCardGame
//
//  Created by ebi igweze on 16/09/2019.
//  Copyright © 2019 ebi igweze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var rightCardImage: UIImageView!
    @IBOutlet weak var leftCardImage: UIImageView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    
    
    private static let winingScore = 15
    private var playerScore = 0
    private var cpuScore = 0
    
    private var gameEnded = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func onDeal(_ sender: Any) {
        if (gameEnded) { return }
        
        // generate random numbers
        let leftRandom = Int.random(in: 2...14)
        let rightRandom = Int.random(in: 2...14)
        
        // update images randomly
        leftCardImage.image = UIImage(named: "card\(leftRandom)")
        rightCardImage.image = UIImage(named: "card\(rightRandom)")
        
    
        // compute the score
        computeScore(user: leftRandom, cpu: rightRandom)
    }
    
    private func computeScore(user: Int, cpu: Int) {
        // compute score based on higher value
        if (cpu > user) {
            cpuScore += 1
            cpuScoreLabel.text = String(cpuScore)
        } else {
            playerScore += 1
            playerScoreLabel.text = String(playerScore)
        }
        
        // check if game has already been won
        if (playerScore == 15) {
            showWinner(winner: "You")
        } else if(cpuScore == 15) {
            showWinner(winner: "CPU")
        }
    }
    
    
    private func showWinner(winner: String) {
        // set game ended
        gameEnded = true
        
        // create alert dialog
        let confirmDialog = UIAlertController(title: "\(winner) won!", message: "Would you like to play again?", preferredStyle: .alert)
        
        // create restart and cancel actions
        let restartAction = UIAlertAction(title: "Yes", style: .default, handler: resetGame)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        // add actions to dialog
        confirmDialog.addAction(restartAction)
        confirmDialog.addAction(cancelAction)
        
        // show alert
        present(confirmDialog, animated: true, completion: nil)
    }
    
    
    private func resetGame(action: UIAlertAction) {
        // generate random numbers
        let leftRandom = Int.random(in: 2...14)
        let rightRandom = Int.random(in: 2...14)
        
        // reset images to random images
        leftCardImage.image = UIImage(named: "card\(leftRandom)")
        rightCardImage.image = UIImage(named: "card\(rightRandom)")
        
        // reset scores
        playerScoreLabel.text = "0"
        cpuScoreLabel.text = "0"
        playerScore = 0
        cpuScore = 0
        
        // reset game flag
        gameEnded = false
    }
}

