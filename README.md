# clarity-sequence

Sequence library for Clarity.

As Clarity is strictly typed, the library provides function variations supporting different datatypes.

Each file in `contracts` implements variations of a function for a specific sequence size, with 
a numerical suffix reflecting the number of bits in the max sequence length. For example, the contract 
named `repeat7.clar` provides functions supporting a max sequence length of 127 = `(- (pow 2 7) 1)`

### repeat

Return a list with `item` repeated `n` times, limited by the max sequence length.

The canonical variation repeats an integer `n` times, with signature:

`(repeat (n int) (item int))`

Variations:

* `(repeat-uint (n int) (item uint))`
* `(repeat-bool (n int) (item bool))`
* `(repeat-string (n int) (item (string-utf ...))`
* `(repeat-ascii (n int) (item (string-ascii ...))`
* `(repeat-buff (n int) (item (buff ...))`
