;; DROP
;;
;; https://github.com/njordhov/clarity-sequence

(define-constant max-len (- (pow 2 7) 1))

(define-private (check-type-integer
                 (value1 int))
 (begin
  (assert- (and (<= -127 value1) (<= value1 127)) "Out of bounds: value1")
  (begin
   (assert- (let ((tmp23 value1))
             (and (<= 0 tmp23) (<= tmp23 127))) "No value matching the type")
   value1)))

(define-private (min-num-integer-integer
                 (left int)
                 (right int))
 (begin
  (assert- (and (<= 0 left) (<= left 127)) "Out of bounds: left")
  (assert- (and (<= 127 right) (<= right 127)) "Out of bounds: right")
  (if (< left right) left right)))

(define-private (asc-list
                 (d int)
                 (l (list 128 int)))
 (let ((n1 (to-int (len l))))
  (if (> n1 d)
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
  (if (> n1 d)
   l
   (unwrap-panic
    (as-max-len?
     (concat l l)
     u128)))))

(define-private (range-1-integer-integer
                 (lo int)
                 (hi int))
 (begin
  (assert- (and (<= 0 lo) (<= lo 127)) "Out of bounds: lo")
  (assert- (and (<= 0 hi) (<= hi 127)) "Out of bounds: hi")
  (let ((d (- hi lo)))
   (fold asc-list
    (fold rep-list (list d d d d d d d) (list d))
    (list lo)))))

(define-private (unwrap-panic-
                 (item1 (optional int)))
 (unwrap-panic item1))

(define-private (is-some-
                 (item1 (optional int)))
 (is-some item1))

(define-private (element-at-
                 (item1 (list 127 int))
                 (item2 int))
 (begin
  (assert- (and (<= 0 item2) (<= item2 127)) "Out of bounds: item2")
  (element-at item1 (to-uint item2))))

(define-private (repeat7b-list
                 (nd int)
                 (vd (list 127 int)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-list-list vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer
                 (n int)
                 (acc {a: (list 128 (list 127 int)), r: (list 127 (list 127 int))}))
 (let ((a (get a acc))
       (r (get r acc))
       (lenr (to-int (len r))))
  (if (< lenr n)
   (let ((c (mod (to-uint (- n lenr))
             (* (len a) u2))))
    {a: (unwrap-panic
         (as-max-len?
          (concat a a)
          u128)),
     r: (if (> c u0)
         (unwrap-panic
          (as-max-len?
           (concat r a)
           u127))
         r)})
   (let ((record35 acc))
    (merge record35
     {a: (get a record35),
      r: (get r record35)})))))

(define-private (repeater-list-list
                 (v (list 127 int))
                 (nrep (list 7 int)))
 (fold repeat-step-integer
  nrep
  {a: (list v),
   r: (list)}))

(define-private (drop-list
                 (n int)
                 (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((seq-len (to-int (len seq))))
   (if (>= n seq-len)
    (list)
    (map unwrap-panic-
     (filter is-some-
      (map element-at-
       (repeat7b-list
        (check-type-integer (- seq-len n))
        seq)
       (range-1-integer-integer
        (min-num-integer-integer n max-len)
        seq-len))))))))

(define-private (assert-
                 (invariant bool)
                 (message (string-ascii 64)))
 (unwrap-panic (if invariant (ok 0) (err message))))

(define-read-only (drop
                   (n int)
                   (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-list n seq)))

(define-private (unwrap-panic-1-
                 (item1 (optional uint)))
 (unwrap-panic item1))

(define-private (is-some-1-
                 (item1 (optional uint)))
 (is-some item1))

(define-private (element-at-1-
                 (item1 (list 127 uint))
                 (item2 int))
 (begin
  (assert- (and (<= 0 item2) (<= item2 127)) "Out of bounds: item2")
  (element-at item1 (to-uint item2))))

(define-private (repeat7b-list1
                 (nd int)
                 (vd (list 127 uint)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-list-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer1
                 (n int)
                 (acc {a: (list 128 (list 127 uint)), r: (list 127 (list 127 uint))}))
 (let ((a (get a acc))
       (r (get r acc))
       (lenr (to-int (len r))))
  (if (< lenr n)
   (let ((c (mod (to-uint (- n lenr))
             (* (len a) u2))))
    {a: (unwrap-panic
         (as-max-len?
          (concat a a)
          u128)),
     r: (if (> c u0)
         (unwrap-panic
          (as-max-len?
           (concat r a)
           u127))
         r)})
   (let ((record71 acc))
    (merge record71
     {a: (get a record71),
      r: (get r record71)})))))

(define-private (repeater-list-list1
                 (v (list 127 uint))
                 (nrep (list 7 int)))
 (fold repeat-step-integer1
  nrep
  {a: (list v),
   r: (list)}))

(define-private (drop-list1
                 (n int)
                 (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((seq-len (to-int (len seq))))
   (if (>= n seq-len)
    (list)
    (map unwrap-panic-1-
     (filter is-some-1-
      (map element-at-1-
       (repeat7b-list1
        (check-type-integer (- seq-len n))
        seq)
       (range-1-integer-integer
        (min-num-integer-integer n max-len)
        seq-len))))))))

(define-read-only (drop-uint
                   (n int)
                   (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-list1 n seq)))

(define-private (unwrap-panic-2-
                 (item1 (optional bool)))
 (unwrap-panic item1))

(define-private (is-some-2-
                 (item1 (optional bool)))
 (is-some item1))

(define-private (element-at-2-
                 (item1 (list 127 bool))
                 (item2 int))
 (begin
  (assert- (and (<= 0 item2) (<= item2 127)) "Out of bounds: item2")
  (element-at item1 (to-uint item2))))

(define-private (repeat7b-list2
                 (nd int)
                 (vd (list 127 bool)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-list-list2 vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer2
                 (n int)
                 (acc {a: (list 128 (list 127 bool)), r: (list 127 (list 127 bool))}))
 (let ((a (get a acc))
       (r (get r acc))
       (lenr (to-int (len r))))
  (if (< lenr n)
   (let ((c (mod (to-uint (- n lenr))
             (* (len a) u2))))
    {a: (unwrap-panic
         (as-max-len?
          (concat a a)
          u128)),
     r: (if (> c u0)
         (unwrap-panic
          (as-max-len?
           (concat r a)
           u127))
         r)})
   (let ((record107 acc))
    (merge record107
     {a: (get a record107),
      r: (get r record107)})))))

(define-private (repeater-list-list2
                 (v (list 127 bool))
                 (nrep (list 7 int)))
 (fold repeat-step-integer2
  nrep
  {a: (list v),
   r: (list)}))

(define-private (drop-list2
                 (n int)
                 (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((seq-len (to-int (len seq))))
   (if (>= n seq-len)
    (list)
    (map unwrap-panic-2-
     (filter is-some-2-
      (map element-at-2-
       (repeat7b-list2
        (check-type-integer (- seq-len n))
        seq)
       (range-1-integer-integer
        (min-num-integer-integer n max-len)
        seq-len))))))))

(define-read-only (drop-bool
                   (n int)
                   (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-list2 n seq)))

(define-private (reducer-buffer-buffer
                 (item3 (buff 1))
                 (acc (buff 128)))
 (unwrap-panic
  (as-max-len?
   (concat acc item3)
   u128)))

(define-private (unwrap-panic-3-
                 (item1 (optional (buff 1))))
 (unwrap-panic item1))

(define-private (is-some-3-
                 (item1 (optional (buff 1))))
 (is-some item1))

(define-private (element-at-3-
                 (item1 (buff 127))
                 (item2 int))
 (begin
  (assert- (and (<= 0 item2) (<= item2 127)) "Out of bounds: item2")
  (element-at item1 (to-uint item2))))

(define-private (repeat7b-buffer
                 (nd int)
                 (vd (buff 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-buffer-list vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer3
                 (n int)
                 (acc {a: (list 128 (buff 127)), r: (list 127 (buff 127))}))
 (let ((a (get a acc))
       (r (get r acc))
       (lenr (to-int (len r))))
  (if (< lenr n)
   (let ((c (mod (to-uint (- n lenr))
             (* (len a) u2))))
    {a: (unwrap-panic
         (as-max-len?
          (concat a a)
          u128)),
     r: (if (> c u0)
         (unwrap-panic
          (as-max-len?
           (concat r a)
           u127))
         r)})
   (let ((record143 acc))
    (merge record143
     {a: (get a record143),
      r: (get r record143)})))))

(define-private (repeater-buffer-list
                 (v (buff 127))
                 (nrep (list 7 int)))
 (fold repeat-step-integer3
  nrep
  {a: (list v),
   r: (list)}))

(define-private (drop-buffer
                 (n int)
                 (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((seq-len (to-int (len seq))))
   (if (>= n seq-len)
    (list)
    (map unwrap-panic-3-
     (filter is-some-3-
      (map element-at-3-
       (repeat7b-buffer
        (check-type-integer (- seq-len n))
        seq)
       (range-1-integer-integer
        (min-num-integer-integer n max-len)
        seq-len))))))))

(define-private (drop-cat-buffer
                 (n int)
                 (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init 0x))
   (fold reducer-buffer-buffer
    (drop-buffer n seq) init))))

(define-read-only (drop-buff
                   (n int)
                   (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-cat-buffer n seq)))

(define-private (reducer-1-string-string
                 (item3 (string-utf8 1))
                 (acc (string-utf8 128)))
 (unwrap-panic
  (as-max-len?
   (concat acc item3)
   u128)))

(define-private (unwrap-panic-4-
                 (item1 (optional (string-utf8 1))))
 (unwrap-panic item1))

(define-private (is-some-4-
                 (item1 (optional (string-utf8 1))))
 (is-some item1))

(define-private (element-at-4-
                 (item1 (string-utf8 127))
                 (item2 int))
 (begin
  (assert- (and (<= 0 item2) (<= item2 127)) "Out of bounds: item2")
  (element-at item1 (to-uint item2))))

(define-private (repeat7b-string
                 (nd int)
                 (vd (string-utf8 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer4
                 (n int)
                 (acc {a: (list 128 (string-utf8 127)), r: (list 127 (string-utf8 127))}))
 (let ((a (get a acc))
       (r (get r acc))
       (lenr (to-int (len r))))
  (if (< lenr n)
   (let ((c (mod (to-uint (- n lenr))
             (* (len a) u2))))
    {a: (unwrap-panic
         (as-max-len?
          (concat a a)
          u128)),
     r: (if (> c u0)
         (unwrap-panic
          (as-max-len?
           (concat r a)
           u127))
         r)})
   (let ((record179 acc))
    (merge record179
     {a: (get a record179),
      r: (get r record179)})))))

(define-private (repeater-string-list
                 (v (string-utf8 127))
                 (nrep (list 7 int)))
 (fold repeat-step-integer4
  nrep
  {a: (list v),
   r: (list)}))

(define-private (drop-string1
                 (n int)
                 (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((seq-len (to-int (len seq))))
   (if (>= n seq-len)
    (list)
    (map unwrap-panic-4-
     (filter is-some-4-
      (map element-at-4-
       (repeat7b-string
        (check-type-integer (- seq-len n))
        seq)
       (range-1-integer-integer
        (min-num-integer-integer n max-len)
        seq-len))))))))

(define-private (drop-cat-string
                 (n int)
                 (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init1 u""))
   (fold reducer-1-string-string
    (drop-string1 n seq) init1))))

(define-read-only (drop-string
                   (n int)
                   (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-cat-string n seq)))

(define-private (reducer-2-string-string
                 (item3 (string-ascii 1))
                 (acc (string-ascii 128)))
 (unwrap-panic
  (as-max-len?
   (concat acc item3)
   u128)))

(define-private (unwrap-panic-5-
                 (item1 (optional (string-ascii 1))))
 (unwrap-panic item1))

(define-private (is-some-5-
                 (item1 (optional (string-ascii 1))))
 (is-some item1))

(define-private (element-at-5-
                 (item1 (string-ascii 127))
                 (item2 int))
 (begin
  (assert- (and (<= 0 item2) (<= item2 127)) "Out of bounds: item2")
  (element-at item1 (to-uint item2))))

(define-private (repeat7b-string1
                 (nd int)
                 (vd (string-ascii 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer5
                 (n int)
                 (acc {a: (list 128 (string-ascii 127)), r: (list 127 (string-ascii 127))}))
 (let ((a (get a acc))
       (r (get r acc))
       (lenr (to-int (len r))))
  (if (< lenr n)
   (let ((c (mod (to-uint (- n lenr))
             (* (len a) u2))))
    {a: (unwrap-panic
         (as-max-len?
          (concat a a)
          u128)),
     r: (if (> c u0)
         (unwrap-panic
          (as-max-len?
           (concat r a)
           u127))
         r)})
   (let ((record215 acc))
    (merge record215
     {a: (get a record215),
      r: (get r record215)})))))

(define-private (repeater-string-list1
                 (v (string-ascii 127))
                 (nrep (list 7 int)))
 (fold repeat-step-integer5
  nrep
  {a: (list v),
   r: (list)}))

(define-private (drop-string2
                 (n int)
                 (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((seq-len (to-int (len seq))))
   (if (>= n seq-len)
    (list)
    (map unwrap-panic-5-
     (filter is-some-5-
      (map element-at-5-
       (repeat7b-string1
        (check-type-integer (- seq-len n))
        seq)
       (range-1-integer-integer
        (min-num-integer-integer n max-len)
        seq-len))))))))

(define-private (drop-cat-string1
                 (n int)
                 (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init2 ""))
   (fold reducer-2-string-string
    (drop-string2 n seq) init2))))

(define-read-only (drop-ascii
                   (n int)
                   (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-cat-string1 n seq)))

;;
