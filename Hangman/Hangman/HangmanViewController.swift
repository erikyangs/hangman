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
    
    @IBOutlet weak var wordLabel: UILabel!
    func updateWordLabel(result: String){
        self.wordLabel.text = result
    }
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBAction func pressGuessButton(_ sender: UIButton) {
        // ?? notation - default value is ""
        var guess:String = guessTextField.text ?? ""
        if(guess.characters.count==1){
            if(!guesses.contains(guess.uppercased())){
                guesses.append(guess.uppercased())
                updateWordLabel(result: answerToBlanks())
            }
        }
        print("Guesses so far: " + String(describing: guesses))
    }
}
