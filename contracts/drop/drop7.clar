;; DROP

(define-constant max-len 127))  ;; (- (pow 2 7) 1)

(define-private (check-type-integer
                 (value1 int))
 (begin
  (assert- (let ((tmp59 value1))
            (and (<= 0 tmp59) (<= tmp59 127))) "No value matching the type")
  value1))

(define-private (min-num-integer-integer
                 (left int)
                 (right int)) 
  (if (< left right) left right))

(define-private (step-list
                 (d int)
                 (l (list 128 int)))
 (let ((n1 (to-int (len l))))
  (if (is-eq 0 (/ d n1)) l
   (unwrap-panic
    (as-max-len?
     (if (> d 0)
      (concat l l)
      (append l
       (+ n1
        (unwrap-panic (element-at l u0)))))
     u128)))))

(define-private (step-list1
                 (d int)
                 (l (list 128 int)))
 (let ((n1 (to-int (len l))))
  (if (is-eq 0 (/ d n1)) l
   (unwrap-panic
    (as-max-len?
     (if (> d 0)
      (concat l l)
      (append l
       (+ n1
        (unwrap-panic (element-at l u0)))))
     u128)))))

(define-private (range-1-integer-integer
                 (lo int)
                 (hi int))
 (let ((d (- hi lo)))
  (fold step-list
   (fold step-list1 (list d d d d d d d) (list (- d)))
   (list lo))))

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

(define-private (repeat-step-integer
                 (n int)
                 (acc {a: (list 128 (list 127 int)), r: (list 127 (list 127 int))})) 
  (let ((a (get a acc))
        (r (get r acc))
        (un (to-uint n))
        (lenr (len r)))
    (if (< lenr un)
      (let ((c (mod (- un lenr)
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
      (let ((record14 acc)) 
       (merge record14
        {a: (get a record14), 
         r: (get r record14)})))))

(define-private (repeater-list-list
                 (v (list 127 int))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-list
                 (nd int)
                 (vd (list 127 int)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-list-list vd (list nd nd nd nd nd nd nd)))))

(define-private (drop-list
                 (n int)
                 (seq (list 127 int)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-
    (filter is-some-
      (map element-at-
        (repeat7b-list (check-type-integer (- (len seq) n))
                 seq)
        (range-1-integer-integer
          (min-num-integer-integer n max-len)
          (check-type-integer (to-int (len seq)))))))))

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

(define-private (repeat-step-integer1
                 (n int)
                 (acc {a: (list 128 (list 127 uint)), r: (list 127 (list 127 uint))})) 
  (let ((a (get a acc))
        (r (get r acc))
        (un (to-uint n))
        (lenr (len r)))
    (if (< lenr un)
      (let ((c (mod (- un lenr)
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
      (let ((record29 acc)) 
       (merge record29
        {a: (get a record29), 
         r: (get r record29)})))))

(define-private (repeater-list-list1
                 (v (list 127 uint))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer1
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-list1
                 (nd int)
                 (vd (list 127 uint)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-list-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (drop-list1
                 (n int)
                 (seq (list 127 uint)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-1-
    (filter is-some-1-
      (map element-at-1-
        (repeat7b-list1 (check-type-integer (- (len seq) n))
                 seq)
        (range-1-integer-integer
          (min-num-integer-integer n max-len)
          (check-type-integer (to-int (len seq)))))))))

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

(define-private (repeat-step-integer2
                 (n int)
                 (acc {a: (list 128 (list 127 bool)), r: (list 127 (list 127 bool))})) 
  (let ((a (get a acc))
        (r (get r acc))
        (un (to-uint n))
        (lenr (len r)))
    (if (< lenr un)
      (let ((c (mod (- un lenr)
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
      (let ((record44 acc)) 
       (merge record44
        {a: (get a record44), 
         r: (get r record44)})))))

(define-private (repeater-list-list2
                 (v (list 127 bool))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer2
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-list2
                 (nd int)
                 (vd (list 127 bool)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-list-list2 vd (list nd nd nd nd nd nd nd)))))

(define-private (drop-list2
                 (n int)
                 (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-2-
    (filter is-some-2-
      (map element-at-2-
        (repeat7b-list2 (check-type-integer (- (len seq) n))
                 seq)
        (range-1-integer-integer
          (min-num-integer-integer n max-len)
          (check-type-integer (to-int (len seq)))))))))

(define-read-only (drop-bool
                    (n int)
                    (seq (list 127 bool)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-list2 n seq)))

(define-private (empty-buffer
                 (seq (buff 127)))
  
    0x)

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

(define-private (repeat-step-integer3
                 (n int)
                 (acc {a: (list 128 (buff 127)), r: (list 127 (buff 127))})) 
  (let ((a (get a acc))
        (r (get r acc))
        (un (to-uint n))
        (lenr (len r)))
    (if (< lenr un)
      (let ((c (mod (- un lenr)
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
      (let ((record59 acc)) 
       (merge record59
        {a: (get a record59), 
         r: (get r record59)})))))

(define-private (repeater-buffer-list
                 (v (buff 127))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer3
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-buffer
                 (nd int)
                 (vd (buff 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-buffer-list vd (list nd nd nd nd nd nd nd)))))

(define-private (drop-buffer
                 (n int)
                 (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-3-
    (filter is-some-3-
      (map element-at-3-
        (repeat7b-buffer (check-type-integer (- (len seq) n))
                 seq)
        (range-1-integer-integer
          (min-num-integer-integer n max-len)
          (check-type-integer (to-int (len seq)))))))))

(define-private (drop-cat-buffer
                 (n int)
                 (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init
         (empty-buffer seq)))
   (fold reducer-buffer-buffer
       (drop-buffer n seq) init))))

(define-read-only (drop-buff
                    (n int)
                    (seq (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-cat-buffer n seq)))

(define-private (empty-string
                 (seq (string-utf8 127)))
    u"")

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

(define-private (repeat-step-integer4
                 (n int)
                 (acc {a: (list 128 (string-utf8 127)), r: (list 127 (string-utf8 127))})) 
  (let ((a (get a acc))
        (r (get r acc))
        (un (to-uint n))
        (lenr (len r)))
    (if (< lenr un)
      (let ((c (mod (- un lenr)
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
      (let ((record74 acc)) 
       (merge record74
        {a: (get a record74), 
         r: (get r record74)})))))

(define-private (repeater-string-list
                 (v (string-utf8 127))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer4
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-string
                 (nd int)
                 (vd (string-utf8 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list vd (list nd nd nd nd nd nd nd)))))

(define-private (drop-string1
                 (n int)
                 (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-4-
    (filter is-some-4-
      (map element-at-4-
        (repeat7b-string (check-type-integer (- (len seq) n))
                 seq)
        (range-1-integer-integer
          (min-num-integer-integer n max-len)
          (check-type-integer (to-int (len seq)))))))))

(define-private (drop-cat-string
                 (n int)
                 (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init1
         (empty-string seq)))
   (fold reducer-1-string-string
       (drop-string1 n seq) init1))))

(define-read-only (drop-string
                    (n int)
                    (seq (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-cat-string n seq)))

(define-private (empty-string1
                 (seq (string-ascii 127)))
  
    "")

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

(define-private (repeat-step-integer5
                 (n int)
                 (acc {a: (list 128 (string-ascii 127)), r: (list 127 (string-ascii 127))})) 
  (let ((a (get a acc))
        (r (get r acc))
        (un (to-uint n))
        (lenr (len r)))
    (if (< lenr un)
      (let ((c (mod (- un lenr)
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
      (let ((record89 acc)) 
       (merge record89
        {a: (get a record89), 
         r: (get r record89)})))))

(define-private (repeater-string-list1
                 (v (string-ascii 127))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer5
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-string1
                 (nd int)
                 (vd (string-ascii 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (drop-string2
                 (n int)
                 (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (map unwrap-panic-5-
    (filter is-some-5-
      (map element-at-5-
        (repeat7b-string1 (check-type-integer (- (len seq) n))
                 seq)
        (range-1-integer-integer
          (min-num-integer-integer n max-len)
          (check-type-integer (to-int (len seq)))))))))

(define-private (drop-cat-string1
                 (n int)
                 (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init2
         (empty-string1 seq)))
   (fold reducer-2-string-string
       (drop-string2 n seq) init2))))

(define-read-only (drop-ascii
                    (n int)
                    (seq (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (drop-cat-string1 n seq)))
