"""A Number Guessing Game"""

import random;
# import guess_game4_impl;


walker GuessGame {
    has guess: int;

    can start with `root entry;
    can process_guess with turn entry;
}
import random;

walker GuessGame {
    has correct_number: int = random.randint(1, 10);

    can start_game with `root entry;
    def process_guess(guess: int);
}

node turn {
    can check with GuessGame entry;
}

# Run the game
 with entry {
    GuessGame() spawn root;
}

node turn {
    has correct_number: int = random.randint(1, 10);
}

# Will run when in CLI mode (not in cloud)
 with entry:__main__ {
    root spawn GuessGame(3);
    root spawn GuessGame(4);
    root spawn GuessGame(5);
    root spawn GuessGame(6);
}