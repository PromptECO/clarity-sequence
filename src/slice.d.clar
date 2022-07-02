;; SLICE

(import {repeat: repeat-
         range: range-})
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (slice- seq (skip Len) (n Len))
  (let ((end (- (min (+ skip n) 
                     (length seq))
                1)))
    (if (>= end skip)
      (for ((i (range- skip end)))
        (unwrap-panic
          (element-at seq i)))
      (list))))

(define-read-only (slice 
                    (seq (List max-len Int))
                    (skip Len)
                    (n Len))                   
  (slice- seq skip n))

(test=
  (slice (list 1 2 3 4 5 6) 2 3)
  (list 3 4 5))
  
(define-read-only (slice-uint
                    (seq (List max-len Uint))
                    (skip Len)
                    (n Len))
  (slice- seq skip n))

(define-read-only (slice-bool  
                    (seq (List max-len Bool))
                    (skip Len)
                    (n Len))
  (slice- seq skip n))

(test=
  (slice-bool (list true false false true) 1 2)
  (list false false))
  
(define (slice-cat seq (skip Len) (n Len))
  (reduce concat
    (empty seq)
    (slice- seq skip n)))

(define-read-only (slice-buff 
                    (seq (Buffer max-len))
                    (skip Len)
                    (n Len))
  (slice-cat seq skip n))

(test=
  (slice-buff 0x112233445566 2 3)
  0x334455)

(define-read-only (slice-string 
                    (seq (String max-len))
                    (skip Len)
                    (n Len))
  (slice-cat seq skip n))
    
(define-read-only (slice-ascii 
                    (seq (String max-len ascii))
                    (skip Len)
                    (n Len))
  (slice-cat seq skip n))

(test=
  (slice-ascii "abcdefgh" 2 3)
  "cde")

;;
