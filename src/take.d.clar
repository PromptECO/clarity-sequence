;; TAKE

(import {repeat: repeat-
         range: range-})
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (take- (n Len) seq)
  (map unwrap-panic
    (map element-at 
      (repeat- n seq)
      (range- 0 (- (min n max-len) 1)))))

(define-read-only (take 
                    (n Len) 
                    (seq (List max-len Int)))
  (take- n seq))

(test=
  (take 3 (list 1 2 3 4 5 6)))
  
(define-read-only (take-uint
                    (n Len) 
                    (seq (List max-len Uint)))
  (take- n seq))

(define-read-only (take-bool 
                    (n Len) 
                    (seq (List max-len Bool)))
  (take- n seq))

(test=
  (take-bool 3 (list true false false true)))
  
(define (take-cat (n Len) seq)
  (reduce concat
    (empty seq)
    (take- n seq)))

(define-read-only (take-buff 
                    (n Len) 
                    (seq (Buffer max-len)))
  (take-cat n seq))

(test=
  (take-buff 3 0x112233445566))

(define-read-only (take-string 
                    (n Len)
                    (seq (String max-len)))
  (take-cat n seq))
    
(define-read-only (take-ascii 
                    (n Len)
                    (seq (String max-len ascii)))
  (take-cat n seq))

;;
