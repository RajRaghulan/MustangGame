//
//  BoardViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/27/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class BoardViewController: UIViewController {

    @IBOutlet weak var boardView: SKView!
    @IBOutlet weak var tapTester: UITapGestureRecognizer!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    
    var game: Game?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.pauseButton.layer.cornerRadius = 7
        self.quitButton.layer.cornerRadius = 7
        
        let board = SKScene(size: self.boardView.bounds.size)

        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: board.size.width / 2, y: board.size.height / 2)
        background.size = CGSize(width: board.size.width, height: board.size.height)
        board.addChild(background)
        
        let player = SKSpriteNode(imageNamed: "avatar-sample")
        player.position = CGPoint(x: board.size.width / 2, y: board.size.height / 2 - 100)
        player.size = CGSize(width: 60, height: 60)
        board.addChild(player)
        
        self.boardView.presentScene(board)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.turnLabel.alpha = 0
        })
        
    }
    
    func startGame() {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is QuestionViewController {
            
            let questionController = segue.destination as? QuestionViewController
            questionController?.game = self.game
            
        }
    }
    @IBAction func moveRight(_ sender: Any) {
        
        let moveRight = SKAction(named: "moveLeft")
        let board = SKScene(fileNamed: "Board")
        
        if let player = board?.childNode(withName: "player") as? SKSpriteNode {
            
            player.run(moveRight!)
            
        }
        
    }

    @IBAction func quitGame(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Quit Game?", message: "Are you sure you want to quit?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Quit", style: .default, handler: { action in
            self.performSegue(withIdentifier: "rewindToHome", sender: self)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}
