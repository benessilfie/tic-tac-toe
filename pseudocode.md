# Pseudocode

- Define a Game class with an initialize method that takes in two player objects and a board object as arguments.
- In the initialize method, assign the two player objects and the board object to instance variables so that they can be accessed throughout the class.
- Define a method called play that will contain the main game loop. In this method, render the initial state of the board and then use a loop to continuously prompt the current player to make a move until the game is over.
- Inside the loop, first check if the game has been won or is a draw. If either of these conditions is true, end the game by printing a message to the console and breaking out of the loop.
- If the game is not over, render the current state of the board and prompt the current player to enter their move. Validate the move to make sure it is a valid position on the board that is not already occupied.
- If the move is valid, update the board with the move and switch to the other player. If the move is invalid, continue prompting the current player until they enter a valid move.
- Outside of the play method, define a method called game_over? that takes in the current board and returns true if the game has been won or is a draw, and false otherwise.
- Define a Board class with an initialize method that creates a 3x3 grid of empty spaces.
- In the Board class, define methods for updating the board with a player's move and checking if the game has been won or is a draw.
- Define a Player class with an initialize method that takes in a name and a symbol (either "X" or "O") as arguments.
- Create a new instance of the Game class and pass in two Player objects and a Board object as arguments.
- Call the play method on the Game object to start the game.
  er.
