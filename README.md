# CLARITY-SEQUENCE

Sequence library for Clarity.

The Clarity files in `contracts` implements variations of a function for a specific sequence size.
As Clarity is strictly typed, the library provides function variations supporting different datatypes.
Each file has a numerical suffix reflecting the number of bits in the max sequence length. For example, the contract 
named `repeat7.clar` provides functions supporting a max sequence length of 127 = `(- (pow 2 7) 1)`
represented in signatures with the placeholder `max-len`.

The clarity code has been generated from the files in the `src` directory but is not yet 
optimized to minimize execution cost and code size. 

## Documentation

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
(distinct-buff (seq (buff max-len)))
(distinct-string (seq (string-utf8 max-len)))
(distinct-ascii (seq (string-ascii max-len)))
```

Testnet: [ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00
](https://explorer.stacks.co/txid/0x74484d4a7eb12441c695b4ffad45de0088801267a6d3619501122865cc32220c?chain=testnet)

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
(drop-buff (n int) (seq (buff max-len)))
(drop-string (n int) (seq (string-utf8 max-len)))
(drop-ascii (n int) (seq (string-ascii max-len)))
```

### flatten

Concatenates every item in a list.

The canonical version concatenates a list of integer-lists:

```clarity
(flatten (seq (list max-len (list max-len int))))
```

Example:

`(flatten (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))` => `(1 2 3 4 5 6 7 8 9)`

Other variations:

```clarity
(flatten-uint (seq (list max-len (list max-len uint))))
(flatten-bool (seq (list max-len (list max-len bool))))
```

### interleave

Returns a list interleaving the items in two sequences. 

The canonical version interleaves two lists of integers:

```clarity
(interleave (seq1 (list max-len int)) (seq2 (list max-len int)))
```

Example:

`(interleave (list 1 2 3) (list 4 5 6)` => `(1 4 2 5 3 6)`

Other variations:

```clarity
(interleave-uint (seq1 (list max-len uint)) (seq2 (list max-len uint)))
(interleave-bool (seq1 (list max-len bool)) (seq2 (list max-len bool)))
```

### interpose

Returns a list of the elements of `seq` separated by `sep`.

The canonical version interposes an integer in a list of integers:

```clarity
(interpose (sep int) (seq (list max-len int)))
```

Example:

`(interpose 0 (list 1 2 3))` => `(1 0 2 0 3)`

Other variations:

```clarity
(interpose-uint (sep uint) (seq (list max-len uint)))
(interpose-bool (sep bool) (seq (list max-len bool)))
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
(keep-uint (seq (list max-len (optional uint))))
(keep-bool (seq (list max-len (optional bool))))
(keep-buff (seq (list max-len (optional (buff 127)))))
(keep-string (seq (list max-len (optional (string-utf8 127)))))
(keep-ascii (seq (list max-len (optional (string-ascii 127)))))
```

### partition

Returns a list of sequences of up to n items each.

The canonical version partitions a list of integers:

```clarity
(partition (seq (list max-len int)))
```

Example:

`(partition 3 (list 1 2 3 4 5 6 7 8 9))` => `((1 2 3) (4 5 6) (7 8 9))`

Other variations:

```clarity
(partition-uint (seq (list max-len uint)))
(partition-bool (seq (list max-len bool)))
(partition-buff (seq (list max-len (buff 127))))
(partition-string (seq (list max-len (string-utf8 127))))
(partition-ascii (seq (list max-len (string-ascii 127))))
```

### range

Returns a sequence in the inclusive range of the arguments.

The canonical version generates a list of integers:

```clarity
(range (first-item int) (last-item int))
```

Example:

`(range 1 9)` => `(1 2 3 4 5 6 7 8 9)`

Other variations:

```clarity
(range-buff (first-item (buff 1)) (last-item (buff 1)))
(range-ascii (first-item (string-ascii 1)) (last-item (string-ascii 1)))
```

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

### replace

Returns a sequence substituting items in a keys sequence with corresponding replacement values.

The canonical variation replaces items in a list of integers, with signature:

```clarity
(replace (seq (list max-len int)) (keys (list max-len int)) (replacements (list max-len int))
```

Example:

`(replace (list 1 2 3 4 5) (list 2 4) (list -2 -4))` => `(1 -2 3 -4 5)`

Variations:

```clarity
(replace-uint (seq (list max-len uint)) (keys (list max-len uint)) (replacements (list max-len uint))
(replace-bool (seq (list max-len bool)) (keys (list max-len bool)) (replacements (list max-len bool))
(replace-string (seq (buff max-len)) (keys (buff max-len)) (replacements (buff max-len)))
(replace-ascii (seq (string-ascii max-len)) (keys (string-ascii max-len)) (replacements (string-ascii max-len)))
(replace-buff (seq (buff max-len)) (keys (buff max-len)) (replacements (buff max-len)))
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
(reverse-buff (seq (buff max-len)))
(reverse-string (seq (string-utf8 max-len)))
(reverse-ascii (seq (string-ascii max-len)))
```

Testnet:

reverse7.clar  
https://explorer.stacks.co/txid/0x54d727c740aa47bb51d4a8aac7ec26c18315cc3c32e98803278835a5a649bc03?chain=testnet

### slice

Returns a sequence taking `n` items after dropping `skip` items.

The canonical version slices a list of integers:

```clarity
(slice (seq (list max-len int)) (skip int) (n int))
```

Example: 

`(slice (list 1 2 3 4 5 6 7 8 9) 2 3)` => `(3 4 5)`

```clarity
(slice-uint (seq (list max-len uint)) (skip int) (n int) ))
(slice-bool (seq (list max-len bool)) (skip int) (n int))
(slice-buff (seq (list max-len (buff 127))) (skip int) (n int))
(slice-string (seq (list max-len (string-utf8 127))) (skip int) (n int))
(slice-ascii (seq (list max-len (string-ascii 127))) (skip int) (n int) ))
```

Testnet: [ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01](https://explorer.stacks.co/txid/0x917d21a59813fb1557549bc72d20b4c6cb049386401007e813694e5043c28f69?chain=testnet)

### stagger

Returns a list of sequences of up to n items each, staggered `step` apart.

The canonical version partitions a list of integers:

```clarity
(stagger (n int) (step int) (seq (list max-len int)))
```

Example:

`(stagger 3 2 (list 1 2 3 4 5 6 7 8 9))` => `((1 2 3) (3 4 5) (5 6 7) (7 8 9))`

Other variations:

```clarity
(stagger-uint (n int) (step int) (seq (list max-len uint)))
(stagger-bool (n int) (step int) (seq (list max-len bool)))
(stagger-buff (n int) (step int) (seq (list max-len (buff 127))))
(stagger-string (n int) (step int) (seq (list max-len (string-utf8 127))))
(stagger-ascii (n int) (step int) (seq (list max-len (string-ascii 127))))
```

### take-nth

Returns a list of every nth element in a sequence.

The canonical version extracts every nth element from a list of integers:

```clarity
(take-nth (step int) (seq (list max-len int)))
```

Example:

`(take-nth 3 (list 1 2 3 4 5 6 7 8 9))` => `(1 4 7)`

Other variations:

```clarity
(take-nth-uint (step int) (seq (list max-len uint))))
(take-nth-bool (step int) (seq (list max-len bool)))
(take-nth-buff (step int) (seq (list max-len (buff 127)))))
(take-nth-string (step int) (seq (list max-len (string-utf8 127)))))
(take-nth-ascii (step int) (seq (list max-len (string-ascii 127)))))
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
(take-buff (n int) (seq (buff max-len)))
(take-string (n int) (seq (string-utf8 max-len)))
(take-ascii (n int) (seq (string-ascii max-len)))
```
