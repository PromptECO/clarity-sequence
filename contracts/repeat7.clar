;; REPEAT (7 bit max length)

(define-constant max-len 127)  ;; (- (pow 2 7) 1))

(define-private (min-num-integer-integer
                 (left int)
                 (right int)) 
  (if (< left right) left right))

(define-private (repeat-step-integer
                 (n int)
                 (acc {a: (list 128 int), r: (list 127 int)})) 
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

(define-private (repeater-integer-list
                 (v int)
                 (nrep (list 7 int))) 
  (fold repeat-step-integer
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-integer
                 (nd int)
                 (vd int))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-integer-list vd (list nd nd nd nd nd nd nd)))))

(define-private (assert-
                 (invariant bool)
                 (message (string-ascii 64)))
 (unwrap-panic (if invariant (ok 0) (err message))))

(define-read-only (repeat
                    (n int)
                    (item int))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat7b-integer (min-num-integer-integer n max-len) item)))

(define-private (repeat-step-integer1
                 (n int)
                 (acc {a: (list 128 uint), r: (list 127 uint)})) 
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
      (let ((record43 acc)) 
       (merge record43
        {a: (get a record43), 
         r: (get r record43)})))))

(define-private (repeater-unsigned-list
                 (v uint)
                 (nrep (list 7 int))) 
  (fold repeat-step-integer1
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-unsigned
                 (nd int)
                 (vd uint))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-unsigned-list vd (list nd nd nd nd nd nd nd)))))

(define-read-only (repeat-uint
                    (n int)
                    (item uint))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat7b-unsigned (min-num-integer-integer n max-len) item)))

(define-private (repeat-step-integer2
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
      (let ((record72 acc)) 
       (merge record72
        {a: (get a record72), 
         r: (get r record72)})))))

(define-private (repeater-string-list
                 (v (string-utf8 127))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer2
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-string
                 (nd int)
                 (vd (string-utf8 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list vd (list nd nd nd nd nd nd nd)))))

(define-read-only (repeat-string
                    (n int)
                    (item (string-utf8 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat7b-string (min-num-integer-integer n max-len) item)))



(define-private (repeat-step-integer3
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
      (let ((record101 acc)) 
       (merge record101
        {a: (get a record101), 
         r: (get r record101)})))))

(define-private (repeater-string-list1
                 (v (string-ascii 127))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer3
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-string1
                 (nd int)
                 (vd (string-ascii 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list1 vd (list nd nd nd nd nd nd nd)))))

(define-read-only (repeat-ascii
                    (n int)
                    (item (string-ascii 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat7b-string1 (min-num-integer-integer n max-len) item)))

(define-private (repeat-step-integer4
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
      (let ((record130 acc)) 
       (merge record130
        {a: (get a record130), 
         r: (get r record130)})))))

(define-private (repeater-buffer-list
                 (v (buff 127))
                 (nrep (list 7 int))) 
  (fold repeat-step-integer4
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-buffer
                 (nd int)
                 (vd (buff 127)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-buffer-list vd (list nd nd nd nd nd nd nd)))))

(define-read-only (repeat-buff
                    (n int)
                    (item (buff 127)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat7b-buffer (min-num-integer-integer n max-len) item)))

(define-private (repeat-step-integer5
                 (n int)
                 (acc {a: (list 128 bool), r: (list 127 bool)})) 
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
      (let ((record159 acc)) 
       (merge record159
        {a: (get a record159), 
         r: (get r record159)})))))

(define-private (repeater-bool-list
                 (v bool)
                 (nrep (list 7 int))) 
  (fold repeat-step-integer5
    nrep
    {a: (list v),
     r: (list)}))

(define-private (repeat7b-bool
                 (nd int)
                 (vd bool))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-bool-list vd (list nd nd nd nd nd nd nd)))))

(define-read-only (repeat-bool
                    (n int)
                    (item bool))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat7b-bool (min-num-integer-integer n max-len) item)))
