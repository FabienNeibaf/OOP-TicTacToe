# OOP-TicTacToe

** Creating Tic-tac-toe console game using Ruby**

It's a game in which two players alternately put Xs and Os in compartments of a figure formed by two vertical lines crossing two horizontal lines and each tries to get a row of three Xs or three Os before the opponent does.
For more explaination go to _https://en.wikipedia.org/wiki/Tic-tac-toe_.

This project is one of the Ruby OOP projects recommended by [Microverse](https://www.microverse.org/) and [The Odin Project](https://www.theodinproject.com)

## Technology used

- [Ruby](https://ruby-lang.org)

This project emphasizes building projects using Ruby's Object-oriented methedology.

## Contributors

- Darshan - [Github Profile](https://github.com/daashandayo)
- Fabien RAKOTOMAMPIANDRA - [Github Profile](https://github.com/FabienNeibaf)

## How to Play

This game required two players. And on start they have to enter their respective names.
The Player 1 will be the one using X symbol
The Player 2 will be the one using O symbol

After that, the game starts by prompting alternatively the desired move of each player beginning with the player 1.
Valid moves are XY or YX with X in (A, B, C) case insensitive and Y in (1, 2, 3).
If one of them entered a wrong move so a message is prompted to alert the player.
Also when a compartment was filled, the next player is not allowed to use it anymore.
So an error message is prompted too if it is the case.

When a player can make an aligned three symbols (horizontally, vertically or diagonally) then he or she will be the winner of the game.
In case of all compartments are filled but we don't have a winner, so the game ends in a draw.

At the end of the game, the players can choose either to restart or stop it.

## Instructions

1. Clone this repository to your local [Ruby](https://www.ruby-lang.org/en/documentation/installation/) environment.
2. Open `OOP-TicTacToe` folder
   ```bash
   cd OOP-TicTacToe
   ```
3. Switch to `development` branch
   ```bash
   $ git checkout development
   ```
4. Go to `bin` directory
   ```bash
   $ cd bin
   ```
5. Run the following command in your `Terminal`:
   ```bash
   $ ruby main.rb
   ```
6. Follow the instructions provided by the Game.
