;; REPEAT

(import {repeat: repeat-
         range: range-})
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (empty- seq)
  (if (is (Buffer max-len) seq)
    0x
    (if (is (String max-len ascii) seq)
      ""
      (if (is (String max-len) seq)
        u""
        (as-max-len (as seq (list)) u0)))))
   
(define-read-only (repeat 
                    (n Len) 
                    (item Int))
  (repeat- (min n max-len) item))

(test=
  (repeat 3 0)
  (list 0 0 0))

(define-read-only (repeat-uint 
                    (n Len) 
                    (item Uint))
  (repeat- (min n max-len) item))
  
(define-read-only (repeat-bool
                    (n Len) 
                    (item Bool))
  (repeat- (min n max-len) item))

(test= 
  (repeat-bool 3 true)
  (list true true true))
  
(define (repeat-cat (n Len) seq)
  (reduce concat
    (empty- seq)
    (repeat- n seq)))

(define-read-only (repeat-string 
                    (n Len)
                    (item (String 1)))
  (repeat-cat (min n max-len) item))

(test=
  (repeat-string 3 u"z")
  u"zzz")

(define-read-only (repeat-ascii 
                    (n Len)
                    (item (String 1 ascii)))
  (repeat-cat (min n max-len) item))

(test= 
  (repeat-ascii 3 "x")
  "xxx")
  
(define-read-only (repeat-buff 
                    (n Len) 
                    (item (Buffer 1)))
  (repeat-cat (min n max-len) item))

(test= 
  (repeat-buff 3 0x42)
  0x424242)
