# Hangman Project - Built for UC Berkeley's iOS Decal #
**More information at [iosdecal.com](http://www.iosdecal.com)**

## Description ##
An iOS application for the Hangman game. Users should be able to start a game, make guesses for a phrase (list of phrases provided), see their progresses toward the phrase, see a list of previously guessed, incorrect letters, see how many guesses they have left (indicated by a hangman image - basic images provided), be alerted of a win or loss, and start a new game.

![alt text](/README-images/hangman.png) 

###  Hangman Game View ###
* A UILabel that displays the "_"s corresponding to each word in the provided puzzle string
* A UILabel that displays the incorrect guesses thus far
* A TextField (where the user enters a letter as a guess)
* The user should only be able to guess a single letter
* A "Guess" button which determines whether the letter entered in the textfield is correct or not, and updates the game accordingly
* If that letter appears in the puzzle string, the corresponding "_" should be replaced by the correctly guessed letter
* If that letter does not appear in the puzzle string, that letter should be added to a UILabel keeping track of "Incorrect Guesses: ", and the Hangman image should update to represent the number of incorrect guesses
* A square-dimensioned UIImageView that represents the "state" of the Hangman, with appropriate images for each "state"

### Finished Game States, Start New Game ###
- A win state, indicated by an Alert (Pop up box). This should prevent additional guesses
- A fail state, indicated by an Alert (Pop up box). This should prevent additional guesses
- A "Start Over" button, which starts a new game
