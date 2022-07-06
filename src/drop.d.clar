;; DROP

(import {repeat: repeat-
         range: range-})
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (drop- (n Len) seq)
  (map unwrap-panic
    (filter is-some
      (map element-at 
        (repeat- (as Len (- (as Len (len seq)) n))
                 seq)
        (range- 
          (min n max-len)
          (as Len (len seq)))))))

(define-read-only (drop 
                    (n Len) 
                    (seq (List max-len Int)))
  (drop- n seq))

(test=
  (drop 3 (list 1 2 3 4 5 6))
  (list 4 5 6))
  
(define-read-only (drop-uint 
                    (n Len) 
                    (seq (List max-len uint)))
  (drop- n seq))

(define-read-only (drop-bool 
                    (n Len) 
                    (seq (List max-len bool)))
  (drop- n seq))

(define (drop-cat (n Len) seq)
  (reduce concat 
    (empty seq)
    (drop- n seq)))

(define-read-only (drop-buff 
                    (n Len) 
                    (seq (Buffer max-len)))
  (drop-cat n seq))

(test=
  (drop-buff 2 0x1122334455)
  0x334455)

(define-read-only (drop-string 
                    (n Len) 
                    (seq (String max-len)))
  (drop-cat n seq))

(test=
  (drop-string 2 u"abcdef")
  u"cdef")

(define-read-only (drop-ascii 
                    (n Len) 
                    (seq (String max-len ascii)))
  (drop-cat n seq))

(test=
  (drop-ascii 2 "abcdef")
  "cdef")
