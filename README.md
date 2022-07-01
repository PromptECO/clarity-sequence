# clarity-sequence

Sequence library for Clarity.

As Clarity is strictly typed, the library provides function variations supporting different datatypes.

Each file in `contracts` implements variations of a function for a specific sequence size, with 
a numerical suffix reflecting the number of bits in the max sequence length. For example, the contract 
named `repeat7.clar` provides functions supporting a max sequence length of 127 = `(- (pow 2 7) 1)`
represented in signatures with the placeholder `max-len`.

Note: This implementation is not yet optimized to minimize execution cost. 

### repeat

Returns a list with `item` repeated `n` times, limited by the max sequence length.

The canonical variation repeats an integer `n` times, with signature:

```clarity
(repeat (n int) (item int))
```

Example:

`(repeat 3 0)` => `(0 0 0)`

Variations:

```clarity
(repeat-uint (n int) (item uint))
(repeat-bool (n int) (item bool))
(repeat-string (n int) (item (string-utf8 max-len)))
(repeat-ascii (n int) (item (string-ascii max-len)))
(repeat-buff (n int) (item (buff max-len)))
```

### take 

Returns a sequence with the first `n` items in `seq`, or all items if there are fewer than n.

The canonical variation takes `n` items from a list of integers, with signature:

```clarity
(take (n int) (seq (list max-len int)))
```

Example:

`(take 3 (list 1 2 3 4 5))` => `(1 2 3)`

Other variations:

```clarity
(take-uint (n int) (seq (list max-len uint)))
(take-bool (n int) (seq (list max-len bool)))
(take-buff (n int) (seq (buffer max-len)))
(take-string (n int) (seq (string-utf8 max-len)))
(take-ascii (n int) (seq (string-ascii max-len)))
```

### drop

Returns a sequence with all but the first n items in seq.

The canonical version drops `n` items from a list of integers, with signature:

```clarity
(drop (n int) (seq (list max-len int)))
```

Example:

`(drop 3 (list 1 2 3 4 5))` => `(4 5)`

Other variations:

```clarity
(drop-uint (n int) (seq (list max-len uint)))
(drop-bool (n int) (seq (list max-len bool)))
(drop-buff (n int) (seq (buffer max-len)))
(drop-string (n int) (seq (string-utf8 max-len)))
(drop-ascii (n int) (seq (string-ascii max-len)))
```

### distinct 

Returns a sequence without duplicate items.

The canonical version removes duplicate items from a list of integers:

```clarity
(distinct (seq (list max-len int)))
```

Example:

`(distint (list 1 2 2 3 1 3))` => `(1 2 3)`

Other variations:

```clarity
(distinct-uint (seq (list max-len uint)))
(distinct-bool (seq (list max-len bool)))
(distinct-buff (seq (buffer max-len)))
(distinct-string (seq (string-utf8 max-len)))
(distinct-ascii (seq (string-ascii max-len)))
```

### reverse 

Returns a sequence in reverse order.

The canonical version reverses a list of integers:

```clarity
(reverse (seq (list max-len int)))
```

Example:

`(reverse (list 1 2 3))` => `(3 2 1)`

Other variations:

```clarity
(reverse-uint (seq (list max-len uint)))
(reverse-bool (seq (list max-len bool)))
(reverse-buff (seq (buffer max-len)))
(reverse-string (seq (string-utf8 max-len)))
(reverse-ascii (seq (string-ascii max-len)))
```

Testnet:

reverse7.clar  
https://explorer.stacks.co/txid/0x54d727c740aa47bb51d4a8aac7ec26c18315cc3c32e98803278835a5a649bc03?chain=testnet

### range

Returns a sequence in the inclusive range of the arguments.

The canonical version generates a list of integers:

```clarity
(range int int)
```

Example:

`(range 1 9)` => `(1 2 3 4 5 6 7 8 9)`

Other variations:

```clarity
(range-buff (first-item (buff 1)) (last-item (buff 1)))
(range-ascii (first-item (string-ascii 1)) (last-item (string-ascii 1)))
```

### keep-some

Returns a list of `some` values from a list of options.

The canonical version returns a list of integers:

```clarity
(keep-some (seq (list max-len int)))
```

Example:

`(keep-some (list none (some 1) none (some 2) none)` => `(1 2)`

Other variations:

```clarity
(keep-uint (seq (list 127 (optional uint))))
(keep-bool (seq (list 127 (optional bool))))
(keep-buff (seq (list 127 (optional (buff 127)))))
(keep-string (seq (list 127 (optional (string-utf8 127)))))
(keep-ascii (seq (list 127 (optional (string-ascii 127)))))
```
