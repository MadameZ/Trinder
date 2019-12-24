//
//  GameFirstViewController.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 14/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import UIKit
import AVFoundation

class GameFirstViewController: UIViewController {

    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var scoreView: UIView!
    
    @IBOutlet weak var yellowTrashButton: UIButton!
    @IBOutlet weak var brownTrashButton: UIButton!
    @IBOutlet weak var whiteTrashButton: UIButton!
    @IBOutlet weak var decheteryButton: UIButton!
    @IBOutlet var iconImageView: [UIImageView]!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextLevel: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    var audioButton = AVAudioPlayer()
    var audioGold = AVAudioPlayer()
    
    var score = 0
    var counter = 0
    var memWrongAnswer = [Int]()
    var nbQuestions = 3
    var currentIndex = 0
    var isWinGoldTrash = false
    
    var tempCard: Card!
    
    
// MARK:- Game
    
     func randomCards(cards: [Card]) -> Card {
        guard let cardTemp = cards.randomElement() else { return tempCard }
        return cardTemp
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        game(cards: Card.cards)
        infoBegin()
//        playMusic()
//        audioPlayer.play()
     
    }
    
    func infoBegin() {
        infoLabel.text = "C'est parti, mon kiki!"
        nextLevel.isHidden = true
        scoreView.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueWrong" {
            if let wrongVC = segue.destination as? WrongAnswerdViewController {
                wrongVC.object = tempCard.image
                wrongVC.text = tempCard.description
                wrongVC.rightAnswerImage = tempCard.icon
                wrongVC.idObject = tempCard.idPoubelle
            } else if segue.identifier == "rightAnswer" {
                if let righVC = segue.destination as? RightAnswerViewController {
                    righVC.descriptionText = Message.rightAnswer
                }
            }
        }
    }
    
    @IBAction func didTapTrashButton(_ sender: UIButton) {
        animateButton(sender: sender)
        
        switch sender.tag {
            case 1:
                houseCard(card: tempCard)
                game(cards: Card.cards)
                playButtonMusic()
                audioButton.play()
            case 2:
                recycleCard(card: tempCard)
                game(cards: Card.cards)
                playButtonMusic()
                audioButton.play()
            
            case 3:
                glassCard(card: tempCard)
                game(cards: Card.cards)
                playButtonMusic()
                audioButton.play()
               
            case 4:
                decheteryCard(card: tempCard)
                game(cards: Card.cards)
                playButtonMusic()
                audioButton.play()
              
            default: return
            }
             print("counter : \(counter)")
             gameOver()
    }

    
    func houseCard(card: Card) {
        if  Object.houseTrash.id == tempCard.idPoubelle {
            winQuestion()
        } else {
            loseQuestion()
        }
            counter += 1
    }

    func recycleCard(card: Card) {
        if  Object.recycleTrash.id == tempCard.idPoubelle {
            winQuestion()
        } else {
            loseQuestion()
        }
        counter += 1
    }

    func glassCard(card: Card) {
        if  Object.glassTrash.id == tempCard.idPoubelle {
            winQuestion()
        } else {
        loseQuestion()
        }
        counter += 1
    }

    func decheteryCard(card: Card) {
        if  Object.dechetery.id == tempCard.idPoubelle {
         winQuestion()
        } else {
        loseQuestion()
        }
        counter += 1
    }

    func game(cards: [Card]) {
        tempCard = randomCards(cards: cards)
        mainImageView.image = tempCard.image

    }

    func winQuestion() {
        score += 10
        displayScore()
        animateView(image: backgroundView)
//        wrongAnswerImaveView.isHidden = true
        winGoldtrash()

    }
    
    func loseQuestion() {
        score -= 5
        displayScore()
        performSegue(withIdentifier: "segueWrong", sender: self)
        memWrongAnswer.append(0)
        gameOver()
    }
    
    func winGoldtrash() {
        if score >= 50 && score <= 55 {
            presentAlert(title: "Bravo", message: "Tu as gagné une poubelle d'or!")
            infoLabel.text = "Wow! Une poubelle d'or. Well done."
            isWinGoldTrash = true
            assignGoldToList()

        } else if score >= 200 && score <= 220 {
            presentAlert(title: "Bravo", message: "La prochaine, tu gagnes la méga poubelle d'or.")
            infoLabel.text = "Tu sais que la prochaine, c'est la méga poubelle d'or."
            isWinGoldTrash = true
            assignGoldToList()

        } else if score >= 350 && score <= 355 {
            performSegue(withIdentifier: "rightSegue", sender: self)
            infoLabel.text = "La méga poubelle d'or...Ça c'est trop la classe!!"
            playGold()
            audioGold.play()
            isWinGoldTrash = true
            assignGoldToList()

        } else if score >= 400 && score <= 415 {
            presentAlert(title: "Bravo", message: "Encore un petit effort!")
            infoLabel.text = "Encore un petit effort 💪"
            isWinGoldTrash = true
            assignGoldToList()
        
        } else if score >= 550 {
            performSegue(withIdentifier: "rightSegue", sender: self)
            infoLabel.text = "⭐️ Bravo! Va au prochain niveau ⭐️"
//            mainImageView.isHidden = true
            playGold()
            audioGold.play()
            questionLabel.isHidden = true
            mainImageView.image = #imageLiteral(resourceName: "heartGrey")
            isWinGoldTrash = true
            assignGoldToList()
            nextLevel.isHidden = false
        }
    }

    func assignGoldToList() {
        if isWinGoldTrash {
            iconImageView![currentIndex].image = #imageLiteral(resourceName: "goldTrash1")
            currentIndex += 1
        }
    }
     
    func gameOver() {
        if memWrongAnswer.count == 10 || score <= 0 {
            score = 0
            displayScore()
            infoLabel.text = "GAME OVER"
        }
    }

    func displayScore() {
         scoreLabel.text = "\(score)"
    }

    @IBAction func didTapNextLevel(_ sender: Any) {
        score = 0
        displayScore()
        for icon in iconImageView {
            icon.image = #imageLiteral(resourceName: "trash3")
        }
        infoLabel.text = "Level 2, bravo !"
        mainImageView.isHidden = false
        questionLabel.isHidden = false
        nextLevel.isHidden = true
    }
    @IBAction func playButton(_ sender: Any) {
        playMusic()
        audioPlayer.play()
    }
    
    @IBAction func playStopButton(_ sender: Any) {
     
        audioPlayer.stop()
    }
       
    // MARK:- method's for the view
    private func addShadow() {
        guard let view = backgroundView else { return }
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 2.0
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 10
    }
    
    func animateButton(sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations:  {
        sender.imageView?.frame.size.width += 100
           sender.imageView?.frame.size.height += 100
        })
    }
    
    func animateView(image: UIView) {
           UIView.animate(withDuration: 0.2, animations:  {
            image.frame.origin.x -= 50
           })
       }
}

// MARK:- Methods for the music
extension GameFirstViewController {
    func playMusic() {
         let sound = Bundle.main.path(forResource: "music", ofType: "wav")
         do {
             audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
         }
         catch {
             print(error)
         }
     }
     
     func playButtonMusic() {
         let sound = Bundle.main.path(forResource: "snare", ofType: "wav")
         do {
             audioButton = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
         }
         catch {
             print(error)
         }
     }
     
     func playGold() {
         let sound = Bundle.main.path(forResource: "gold", ofType: "wav")
         do {
             audioGold = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
         }
         catch {
             print(error)
         }
     }
     
}


// MARK:- Alert
extension GameFirstViewController {
    
    private func presentAlert(title: String, message: String) {
//        let imageView = UIImageView(frame: CGRect(x: 100, y: 10, width: 200, height: 200))
//        imageView.image = UIImage(named: "goldTrash")
        let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let answer = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.score += 100
            self.displayScore()
        })
        
        alerController.addAction(answer)
        present(alerController, animated: true, completion: nil)
    }
}

