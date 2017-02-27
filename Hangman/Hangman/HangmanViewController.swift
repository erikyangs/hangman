//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    /*
     Variables
     */
    var answer = "";
    var guesses = [String]();
    var incorrectGuesses = [String]();
    
    /*
     Original Base
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        
        //PERSONAL CODE
        print("Answer is: " + phrase)
        answer = phrase.uppercased();
        updateWordLabel(result: answerToBlanks());
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func answerToBlanks()->String{
        var result = ""
        for char in answer.characters{
            if (char == " "){
                result += "  "
            }
            else if (!guesses.contains(String(char))){
                result += "_ "
            }
            else{
                result += String(char) + " "
            }
        }
        return result
    }
    
    @IBOutlet weak var hangmanImage: UIImageView!
    func updateHangmanImage(){
        let num = incorrectGuesses.count
        if(num==0){
            hangmanImage.image = UIImage(named: "hangman1")
        }
        if(num<=6){
            let imgString: String = "hangman" + String(num+1)
            hangmanImage.image = UIImage(named: imgString)
        }
    }
    
    @IBOutlet weak var wordLabel: UILabel!
    func updateWordLabel(result: String){
        self.wordLabel.text = result
    }
    
    @IBOutlet weak var incorrectGuessesLabel: UILabel!
    func updateIncorrectGuessesLabel(){
        var result = "Incorrect Guesses: ";
        for letter in incorrectGuesses{
            result += letter + " "
        }
        self.incorrectGuessesLabel.text = result
    }
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBAction func pressGuessButton(_ sender: UIButton) {
        // ?? notation - default value is ""
        var guess:String = guessTextField.text ?? ""
        if(guess.characters.count==1){
            if(guess != " " && !guesses.contains(guess.uppercased())){
                guesses.append(guess.uppercased())
                if(!answer.contains(guess.uppercased())){
                    incorrectGuesses.append(guess.uppercased())
                }
                updateWordLabel(result: answerToBlanks())
                updateIncorrectGuessesLabel()
                updateHangmanImage()
                checkWin()
            }
        }
        //print("Guesses so far: " + String(describing: guesses))
        //print("Incorrect guesses so far: " + String(describing: incorrectGuesses))
    }
    
    func checkWin(){
        //win
        var guessMatches = true
        for char in answer.characters{
            if char != " " && !guesses.contains(String(char)){
                guessMatches = false
            }
        }
        if(guessMatches){
            //print("Game Won")
            finishGameAlert(msg: "You Won!")
        }

        //lose
        if(incorrectGuesses.count>=6){
            //print("Game Lost")
            finishGameAlert(msg: "You Lost!")
        }
    }
    
    func finishGameAlert(msg: String){
        let alertController = UIAlertController(title: msg, message:
            nil, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default,handler: restartGame))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func restartGame(alert: UIAlertAction!){
        print("Game has been restarted.")
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        
        print("Answer is: " + phrase)
        answer = phrase.uppercased();
        updateWordLabel(result: answerToBlanks());
        
        guesses = [String]();
        incorrectGuesses = [String]();
        
        updateWordLabel(result: answerToBlanks())
        updateIncorrectGuessesLabel()
        updateHangmanImage()
    }
}
