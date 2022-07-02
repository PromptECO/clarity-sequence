;; TAKE-NTH

(define-constant max-len (- (pow 2 7) 1))

(define-private (max-num-integer-integer
                 (left int)
                 (right int))
 (begin
  (assert- (and (<= 0 left) (<= left 127)) "Out of bounds: left")
  (assert- (and (<= 1 right) (<= right 1)) "Out of bounds: right")
  (if (> left right) left right)))

(define-private (min-num-integer-integer
                 (left int)
                 (right int))
 (begin
  (assert- (and (<= 0 left) (<= left 127)) "Out of bounds: left")
  (assert- (and (<= 0 right) (<= right 126)) "Out of bounds: right")
  (if (< left right) left right)))

(define-private (asc-list
                 (d int)
                 (l (list 128 int)))
 (let ((n (to-int (len l))))
  (if (>= n d)
   l
   (unwrap-panic
    (as-max-len?
     (append l
      (+ n
       (unwrap-panic (element-at l u0))))
     u128)))))

(define-private (rep-list
                 (d int)
                 (l (list 128 int)))
 (let ((n (to-int (len l))))
  (if (>= n d)
   l
   (unwrap-panic
    (as-max-len?
     (concat l l)
     u128)))))

(define-private (range-integer-integer
                 (lo int)
                 (hi int))
 (begin
  (assert- (and (<= 0 lo) (<= lo 0)) "Out of bounds: lo")
  (assert- (and (<= 0 hi) (<= hi 126)) "Out of bounds: hi")
  (let ((d (- hi lo)))
   (fold asc-list
    (fold rep-list (list d d d d d d d) (list d))
    (list lo)))))

(define-private (for-step-integer-list-integer
                 (g int)
                 (seq (list 127 int))
                 (step int))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (unwrap-panic
   (element-at seq
    (to-uint (* g step))))))

(define-private (repeat127-list
                 (x (list 127 int)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (repeat127-integer
                 (x int))
 (begin
  (assert- (and (<= 0 x) (<= x 127)) "Out of bounds: x")
  (list
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x)))

(define-private (take-nth-list
                 (step int)
                 (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (let ((g (range-integer-integer 0 (min-num-integer-integer step (/ (- (to-int (len seq)) 1)
                                                                   (max-num-integer-integer step 1))))))
   (map for-step-integer-list-integer g
    (repeat127-list seq)
    (repeat127-integer step)))))

(define-private (assert-
                 (invariant bool)
                 (message (string-ascii 64)))
 (unwrap-panic (if invariant (ok 0) (err message))))

(define-read-only (take-nth
                   (step int)
                   (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (take-nth-list step seq)))

(define-private (for-step-integer-list-integer1
                 (g int)
                 (seq (list 127 uint))
                 (step int))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (unwrap-panic
   (element-at seq
    (to-uint (* g step))))))

(define-private (repeat127-list1
                 (x (list 127 uint)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (take-nth-list1
                 (step int)
                 (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (let ((g (range-integer-integer 0 (min-num-integer-integer step (/ (- (to-int (len seq)) 1)
                                                                   (max-num-integer-integer step 1))))))
   (map for-step-integer-list-integer1 g
    (repeat127-list1 seq)
    (repeat127-integer step)))))

(define-read-only (take-nth-uint
                   (step int)
                   (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (take-nth-list1 step seq)))

(define-private (for-step-integer-list-integer2
                 (g int)
                 (seq (list 127 bool))
                 (step int))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (unwrap-panic
   (element-at seq
    (to-uint (* g step))))))

(define-private (repeat127-list2
                 (x (list 127 bool)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (take-nth-list2
                 (step int)
                 (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (let ((g (range-integer-integer 0 (min-num-integer-integer step (/ (- (to-int (len seq)) 1)
                                                                   (max-num-integer-integer step 1))))))
   (map for-step-integer-list-integer2 g
    (repeat127-list2 seq)
    (repeat127-integer step)))))

(define-read-only (take-nth-bool
                   (step int)
                   (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (take-nth-list2 step seq)))

(define-private (for-step-integer-buffer-integer
                 (g int)
                 (seq (buff 127))
                 (step int))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (unwrap-panic
   (element-at seq
    (to-uint (* g step))))))

(define-private (repeat127-buffer
                 (x (buff 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (take-nth-buffer
                 (step int)
                 (seq (buff 127)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (let ((g (range-integer-integer 0 (min-num-integer-integer step (/ (- (to-int (len seq)) 1)
                                                                   (max-num-integer-integer step 1))))))
   (map for-step-integer-buffer-integer g
    (repeat127-buffer seq)
    (repeat127-integer step)))))

(define-read-only (take-nth-buff
                   (step int)
                   (seq (buff 127)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (take-nth-buffer step seq)))

(define-private (for-step-integer-string-integer
                 (g int)
                 (seq (string-utf8 127))
                 (step int))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (unwrap-panic
   (element-at seq
    (to-uint (* g step))))))

(define-private (repeat127-string
                 (x (string-utf8 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (take-nth-string
                 (step int)
                 (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (let ((g (range-integer-integer 0 (min-num-integer-integer step (/ (- (to-int (len seq)) 1)
                                                                   (max-num-integer-integer step 1))))))
   (map for-step-integer-string-integer g
    (repeat127-string seq)
    (repeat127-integer step)))))

(define-read-only (stagger-string
                   (step int)
                   (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (take-nth-string step seq)))

(define-private (for-step-integer-string-integer1
                 (g int)
                 (seq (string-ascii 127))
                 (step int))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (unwrap-panic
   (element-at seq
    (to-uint (* g step))))))

(define-private (repeat127-string1
                 (x (string-ascii 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (take-nth-string1
                 (step int)
                 (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (let ((g (range-integer-integer 0 (min-num-integer-integer step (/ (- (to-int (len seq)) 1)
                                                                   (max-num-integer-integer step 1))))))
   (map for-step-integer-string-integer1 g
    (repeat127-string1 seq)
    (repeat127-integer step)))))

(define-read-only (stagger-ascii
                   (step int)
                   (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 step) (<= step 127)) "Out of bounds: step")
  (take-nth-string1 step seq)))

;;
