;; INTERPOSE

(define-constant max-len (- (pow 2 7) 1))

(define-private (reducer-list-list
                 (item (list 2 int))
                 (acc (list 254 int)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u254)))

(define-private (list-
                 (item1 int)
                 (item2 int))
 (list item1 item2))

(define-private (assert-
                 (invariant bool)
                 (message (string-ascii 64)))
 (unwrap-panic (if invariant (ok 0) (err message))))

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
   (let ((record49 acc))
    (merge record49
     {a: (get a record49),
      r: (get r record49)})))))

(define-private (repeater-integer-list1
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
  (assert- (and (<= 0 nd) (<= nd 126)) "Out of bounds: nd")
  (get r (repeater-integer-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (repeater-integer-list
                 (v int)
                 (nrep (list 7 int)))
 (fold repeat-step-integer
  nrep
  {a: (list v),
   r: (list)}))

(define-private (interpose-integer-list
                 (sep int)
                 (seq (list 127 int)))
 (append
  (let ((init
         (list)))
   (fold reducer-list-list
    (map list- seq (repeat7b-integer (- (to-int (len seq)) 1) sep)) init))
  (unwrap-panic
   (element-at seq (- (len seq) u1)))))

(define-read-only (interpose
                   (sep int)
                   (seq (list 127 int)))
 (interpose-integer-list sep seq))

(define-private (reducer-1-list-list
                 (item (list 2 uint))
                 (acc (list 254 uint)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u254)))

(define-private (list-1-
                 (item1 uint)
                 (item2 uint))
 (list item1 item2))

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
   (let ((record113 acc))
    (merge record113
     {a: (get a record113),
      r: (get r record113)})))))

(define-private (repeater-unsigned-list1
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
  (assert- (and (<= 0 nd) (<= nd 126)) "Out of bounds: nd")
  (get r (repeater-unsigned-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (repeater-unsigned-list
                 (v uint)
                 (nrep (list 7 int)))
 (fold repeat-step-integer1
  nrep
  {a: (list v),
   r: (list)}))

(define-private (interpose-unsigned-list
                 (sep uint)
                 (seq (list 127 uint)))
 (append
  (let ((init1
         (list)))
   (fold reducer-1-list-list
    (map list-1- seq (repeat7b-unsigned (- (to-int (len seq)) 1) sep)) init1))
  (unwrap-panic
   (element-at seq (- (len seq) u1)))))

(define-read-only (interpose-uint
                   (sep uint)
                   (seq (list 127 uint)))
 (interpose-unsigned-list sep seq))

(define-private (reducer-2-list-list
                 (item (list 2 bool))
                 (acc (list 254 bool)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u254)))

(define-private (list-2-
                 (item1 bool)
                 (item2 bool))
 (list item1 item2))

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
   (let ((record177 acc))
    (merge record177
     {a: (get a record177),
      r: (get r record177)})))))

(define-private (repeater-bool-list1
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
  (assert- (and (<= 0 nd) (<= nd 126)) "Out of bounds: nd")
  (get r (repeater-bool-list1 vd (list nd nd nd nd nd nd nd)))))

(define-private (repeater-bool-list
                 (v bool)
                 (nrep (list 7 int)))
 (fold repeat-step-integer2
  nrep
  {a: (list v),
   r: (list)}))

(define-private (interpose-bool-list
                 (sep bool)
                 (seq (list 127 bool)))
 (append
  (let ((init2
         (list)))
   (fold reducer-2-list-list
    (map list-2- seq (repeat7b-bool (- (to-int (len seq)) 1) sep)) init2))
  (unwrap-panic
   (element-at seq (- (len seq) u1)))))

(define-read-only (interpose-bool
                   (sep bool)
                   (seq (list 127 bool)))
 (interpose-bool-list sep seq))

;;
