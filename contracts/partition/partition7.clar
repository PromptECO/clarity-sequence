;; PARTITION

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
 (let ((n1 (to-int (len l))))
  (if (>= n1 d)
   l
   (unwrap-panic
    (as-max-len?
     (append l
      (+ n1
       (unwrap-panic (element-at l u0))))
     u128)))))

(define-private (rep-list
                 (d int)
                 (l (list 128 int)))
 (let ((n1 (to-int (len l))))
  (if (>= n1 d)
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

(define-private (rep-list1
                 (d int)
                 (l (list 128 int)))
 (let ((n1 (to-int (len l))))
  (if (>= n1 d)
   l
   (unwrap-panic
    (as-max-len?
     (concat l l)
     u128)))))

(define-private (range-integer-integer1
                 (lo int)
                 (hi int))
 (begin
  (assert- (and (<= 0 lo) (<= lo 0)) "Out of bounds: lo")
  (assert- (and (<= -1 hi) (<= hi 126)) "Out of bounds: hi")
  (let ((d (- hi lo)))
   (fold asc-list
    (fold rep-list1 (list d d d d d d d) (list d))
    (list lo)))))

(define-private (unwrap-panic-
                 (item1 (optional int)))
 (unwrap-panic item1))

(define-private (is-some-
                 (item1 (optional int)))
 (is-some item1))

(define-private (for-step-1-integer-list-integer-integer
                 (i int)
                 (seq (list 127 int))
                 (g int)
                 (n int))
 (begin
  (assert- (and (<= 0 i) (<= i 126)) "Out of bounds: i")
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (element-at seq
   (to-uint (+ (* g n) i)))))

(define-private (repeat127-integer1
                 (x int))
 (begin
  (assert- (and (<= 0 x) (<= x 126)) "Out of bounds: x")
  (list
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x)))

(define-private (for-step-integer-integer-list
                 (g int)
                 (n int)
                 (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-
   (filter is-some-
    (let ((i (range-integer-integer1 0 (- n 1))))
     (map for-step-1-integer-list-integer-integer i
      (repeat127-list seq)
      (repeat127-integer1 g)
      (repeat127-integer n)))))))

(define-private (repeat127-integer
                 (x int))
 (begin
  (assert- (and (<= 0 x) (<= x 127)) "Out of bounds: x")
  (list
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
   x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x)))

(define-private (repeat127-list
                 (x (list 127 int)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (partition-list
                 (n int)
                 (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((g (range-integer-integer 0 (min-num-integer-integer n (/ (- (to-int (len seq)) 1)
                                                                (max-num-integer-integer n 1))))))
   (map for-step-integer-integer-list g
    (repeat127-integer n)
    (repeat127-list seq)))))

(define-private (assert-
                 (invariant bool)
                 (message (string-ascii 64)))
 (unwrap-panic (if invariant (ok 0) (err message))))

(define-read-only (partition
                   (n int)
                   (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (partition-list n seq)))

(define-private (unwrap-panic-1-
                 (item1 (optional uint)))
 (unwrap-panic item1))

(define-private (is-some-1-
                 (item1 (optional uint)))
 (is-some item1))

(define-private (for-step-1-integer-list-integer-integer1
                 (i int)
                 (seq (list 127 uint))
                 (g int)
                 (n int))
 (begin
  (assert- (and (<= 0 i) (<= i 126)) "Out of bounds: i")
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (element-at seq
   (to-uint (+ (* g n) i)))))

(define-private (for-step-integer-integer-list1
                 (g int)
                 (n int)
                 (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-1-
   (filter is-some-1-
    (let ((i (range-integer-integer1 0 (- n 1))))
     (map for-step-1-integer-list-integer-integer1 i
      (repeat127-list1 seq)
      (repeat127-integer1 g)
      (repeat127-integer n)))))))

(define-private (repeat127-list1
                 (x (list 127 uint)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (partition-list1
                 (n int)
                 (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((g (range-integer-integer 0 (min-num-integer-integer n (/ (- (to-int (len seq)) 1)
                                                                (max-num-integer-integer n 1))))))
   (map for-step-integer-integer-list1 g
    (repeat127-integer n)
    (repeat127-list1 seq)))))

(define-read-only (partition-uint
                   (n int)
                   (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (partition-list1 n seq)))

(define-private (unwrap-panic-2-
                 (item1 (optional bool)))
 (unwrap-panic item1))

(define-private (is-some-2-
                 (item1 (optional bool)))
 (is-some item1))

(define-private (for-step-1-integer-list-integer-integer2
                 (i int)
                 (seq (list 127 bool))
                 (g int)
                 (n int))
 (begin
  (assert- (and (<= 0 i) (<= i 126)) "Out of bounds: i")
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (element-at seq
   (to-uint (+ (* g n) i)))))

(define-private (for-step-integer-integer-list2
                 (g int)
                 (n int)
                 (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-2-
   (filter is-some-2-
    (let ((i (range-integer-integer1 0 (- n 1))))
     (map for-step-1-integer-list-integer-integer2 i
      (repeat127-list2 seq)
      (repeat127-integer1 g)
      (repeat127-integer n)))))))

(define-private (repeat127-list2
                 (x (list 127 bool)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (partition-list2
                 (n int)
                 (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((g (range-integer-integer 0 (min-num-integer-integer n (/ (- (to-int (len seq)) 1)
                                                                (max-num-integer-integer n 1))))))
   (map for-step-integer-integer-list2 g
    (repeat127-integer n)
    (repeat127-list2 seq)))))

(define-read-only (partition-bool
                   (n int)
                   (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (partition-list2 n seq)))

(define-private (unwrap-panic-3-
                 (item1 (optional (buff 1))))
 (unwrap-panic item1))

(define-private (is-some-3-
                 (item1 (optional (buff 1))))
 (is-some item1))

(define-private (for-step-1-integer-buffer-integer-integer
                 (i int)
                 (seq (buff 127))
                 (g int)
                 (n int))
 (begin
  (assert- (and (<= 0 i) (<= i 126)) "Out of bounds: i")
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (element-at seq
   (to-uint (+ (* g n) i)))))

(define-private (for-step-integer-integer-buffer
                 (g int)
                 (n int)
                 (seq (buff 127)))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-3-
   (filter is-some-3-
    (let ((i (range-integer-integer1 0 (- n 1))))
     (map for-step-1-integer-buffer-integer-integer i
      (repeat127-buffer seq)
      (repeat127-integer1 g)
      (repeat127-integer n)))))))

(define-private (repeat127-buffer
                 (x (buff 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (partition-buffer
                 (n int)
                 (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((g (range-integer-integer 0 (min-num-integer-integer n (/ (- (to-int (len seq)) 1)
                                                                (max-num-integer-integer n 1))))))
   (map for-step-integer-integer-buffer g
    (repeat127-integer n)
    (repeat127-buffer seq)))))

(define-read-only (partition-buff
                   (n int)
                   (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (partition-buffer n seq)))

(define-private (unwrap-panic-4-
                 (item1 (optional (string-utf8 1))))
 (unwrap-panic item1))

(define-private (is-some-4-
                 (item1 (optional (string-utf8 1))))
 (is-some item1))

(define-private (for-step-1-integer-string-integer-integer
                 (i int)
                 (seq (string-utf8 127))
                 (g int)
                 (n int))
 (begin
  (assert- (and (<= 0 i) (<= i 126)) "Out of bounds: i")
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (element-at seq
   (to-uint (+ (* g n) i)))))

(define-private (for-step-integer-integer-string
                 (g int)
                 (n int)
                 (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-4-
   (filter is-some-4-
    (let ((i (range-integer-integer1 0 (- n 1))))
     (map for-step-1-integer-string-integer-integer i
      (repeat127-string seq)
      (repeat127-integer1 g)
      (repeat127-integer n)))))))

(define-private (repeat127-string
                 (x (string-utf8 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (partition-string1
                 (n int)
                 (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((g (range-integer-integer 0 (min-num-integer-integer n (/ (- (to-int (len seq)) 1)
                                                                (max-num-integer-integer n 1))))))
   (map for-step-integer-integer-string g
    (repeat127-integer n)
    (repeat127-string seq)))))

(define-read-only (partition-string
                   (n int)
                   (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (partition-string1 n seq)))

(define-private (unwrap-panic-5-
                 (item1 (optional (string-ascii 1))))
 (unwrap-panic item1))

(define-private (is-some-5-
                 (item1 (optional (string-ascii 1))))
 (is-some item1))

(define-private (for-step-1-integer-string-integer-integer1
                 (i int)
                 (seq (string-ascii 127))
                 (g int)
                 (n int))
 (begin
  (assert- (and (<= 0 i) (<= i 126)) "Out of bounds: i")
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (element-at seq
   (to-uint (+ (* g n) i)))))

(define-private (for-step-integer-integer-string1
                 (g int)
                 (n int)
                 (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 g) (<= g 126)) "Out of bounds: g")
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-5-
   (filter is-some-5-
    (let ((i (range-integer-integer1 0 (- n 1))))
     (map for-step-1-integer-string-integer-integer1 i
      (repeat127-string1 seq)
      (repeat127-integer1 g)
      (repeat127-integer n)))))))

(define-private (repeat127-string1
                 (x (string-ascii 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (partition-string2
                 (n int)
                 (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((g (range-integer-integer 0 (min-num-integer-integer n (/ (- (to-int (len seq)) 1)
                                                                (max-num-integer-integer n 1))))))
   (map for-step-integer-integer-string1 g
    (repeat127-integer n)
    (repeat127-string1 seq)))))

(define-read-only (partition-ascii
                   (n int)
                   (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (partition-string2 n seq)))

;;
