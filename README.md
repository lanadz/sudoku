# Description

This is simple Sudoku puzzle solver.

### Requirements and How to run code
- Project was created and tested in `ruby 2.3.1`
- Run `bundle install` command
- Run tests `rspec .`
- Make sure that `run` script has executable flag if not run `chmod +x run`
- Run `run` script using `./run path_to_puzzle_file` command
- File inputs are present in fixtures directory so you can solve those puzzles 
  - `./run fixtures/1.sudoku`
  - `./run fixtures/2.sudoku`
  - `./run fixtures/3.sudoku`

### Explanation

`Sudoku::Board` expects 2-dimensional array of integers as an input. 

```
puzzle = Sudoku::Puzzle.new(Sudoku::Board.new(array))
puzzle.solve
```

To print result you use `BoardPresenter#content`

```
Sudoku::BoardPresenter.new(puzzle.board).content
```

Puzzle is validating its board to check that board size is right and input numbers are in the valid range (0-9).

Initialized board is sent to `Puzzle` and `Puzzle` triggers `Resolver`.

During the first phase the algorithm fills all empty cells with optionals and then tries to find uniq optionals.

If the algorithm fails to resolve the puzzle during the first phase it starts to "guess".
It goes through all optionals of first found empty cell, sets cell's value from optional and recursively starts the new instance of the Resolver.
