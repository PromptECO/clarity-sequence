;; REPEAT

(define-constant max-len (- (pow 2 7) 1))

(define-private (min-num-integer-integer
                 (left int)
                 (right int))
 (begin
  (assert- (and (<= 0 left) (<= left 127)) "Out of bounds: left")
  (assert- (and (<= 127 right) (<= right 127)) "Out of bounds: right")
  (if (< left right) left right)))

(define-private (repeat-step-integer
                 (n int)
                 (acc {a: (list 128 int), r: (list 127 int)}))
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
   (let ((record29 acc))
    (merge record29
     {a: (get a record29),
      r: (get r record29)})))))

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
                 (acc {a: (list 128 bool), r: (list 127 bool)}))
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
   (let ((record44 acc))
    (merge record44
     {a: (get a record44),
      r: (get r record44)})))))

(define-private (repeater-bool-list
                 (v bool)
                 (nrep (list 7 int)))
 (fold repeat-step-integer2
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

(define-private (empty-string
                 (seq (string-utf8 1)))

 u"")

(define-private (reducer-string-string
                 (item (string-utf8 1))
                 (acc (string-utf8 127)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u127)))

(define-private (repeat7b-string
                 (nd int)
                 (vd (string-utf8 1)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer3
                 (n int)
                 (acc {a: (list 128 (string-utf8 1)), r: (list 127 (string-utf8 1))}))
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
   (let ((record87 acc))
    (merge record87
     {a: (get a record87),
      r: (get r record87)})))))

(define-private (repeater-string-list
                 (v (string-utf8 1))
                 (nrep (list 7 int)))
 (fold repeat-step-integer3
  nrep
  {a: (list v),
   r: (list)}))

(define-private (repeat-cat-string
                 (n int)
                 (seq (string-utf8 1)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init
         (empty-string seq)))
   (fold reducer-string-string
    (repeat7b-string n seq) init))))

(define-read-only (repeat-string
                   (n int)
                   (item (string-utf8 1)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat-cat-string (min-num-integer-integer n max-len) item)))

(define-private (empty-string1
                 (seq (string-ascii 1)))

 "")

(define-private (reducer-1-string-string
                 (item (string-ascii 1))
                 (acc (string-ascii 127)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u127)))

(define-private (repeat7b-string1
                 (nd int)
                 (vd (string-ascii 1)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-string-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer4
                 (n int)
                 (acc {a: (list 128 (string-ascii 1)), r: (list 127 (string-ascii 1))}))
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
   (let ((record130 acc))
    (merge record130
     {a: (get a record130),
      r: (get r record130)})))))

(define-private (repeater-string-list1
                 (v (string-ascii 1))
                 (nrep (list 7 int)))
 (fold repeat-step-integer4
  nrep
  {a: (list v),
   r: (list)}))

(define-private (repeat-cat-string1
                 (n int)
                 (seq (string-ascii 1)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init1
         (empty-string1 seq)))
   (fold reducer-1-string-string
    (repeat7b-string1 n seq) init1))))

(define-read-only (repeat-ascii
                   (n int)
                   (item (string-ascii 1)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat-cat-string1 (min-num-integer-integer n max-len) item)))

(define-private (empty-buffer
                 (seq (buff 1)))

 0x)

(define-private (reducer-2-buffer-buffer
                 (item (buff 1))
                 (acc (buff 127)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u127)))

(define-private (repeat7b-buffer
                 (nd int)
                 (vd (buff 1)))
 (begin
  (assert- (and (<= 0 nd) (<= nd 127)) "Out of bounds: nd")
  (get r (repeater-buffer-list vd (list nd nd nd nd nd nd nd)))))

(define-private (repeat-step-integer5
                 (n int)
                 (acc {a: (list 128 (buff 1)), r: (list 127 (buff 1))}))
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
   (let ((record173 acc))
    (merge record173
     {a: (get a record173),
      r: (get r record173)})))))

(define-private (repeater-buffer-list
                 (v (buff 1))
                 (nrep (list 7 int)))
 (fold repeat-step-integer5
  nrep
  {a: (list v),
   r: (list)}))

(define-private (repeat-cat-buffer
                 (n int)
                 (seq (buff 1)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (let ((init2
         (empty-buffer seq)))
   (fold reducer-2-buffer-buffer
    (repeat7b-buffer n seq) init2))))

(define-read-only (repeat-buff
                   (n int)
                   (item (buff 1)))
 (begin
  (assert- (and (<= 0 n) (<= n 127)) "Out of bounds: n")
  (repeat-cat-buffer (min-num-integer-integer n max-len) item)))
