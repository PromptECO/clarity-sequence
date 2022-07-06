;; RANGE

(import {repeat: repeat-
         range: range-})
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))
        
(define (subseq- seq (n Len) (m Len))
  (let ((sub-len (as Len (- m n -1))))
    (map unwrap-panic
      (filter is-some
        (map element-at 
          (repeat- sub-len seq)
          (range- n m))))))

(define-read-only (range (low Int) (high Int))
  (let ((n (as Len (- high low -1))))
    (map + (range- 0 (min n max-len))
           (repeat- n low))))
 
(test= 
  (range 5 8)
  (list 5 6 7 8))
  
(define (seq-range seq first-item last-item)
  (reduce concat
    (empty seq)
    (subseq- seq 
      (as (Int 0 255) 
        (unwrap-panic (index-of seq first-item))) 
      (as (Int 0 255) 
        (unwrap-panic (index-of seq last-item))))))
  
(define-constant buffer-range (range- 0x00 0xff))

(define-read-only (range-buff 
                    (first-item (Buffer 1)) 
                    (last-item (Buffer 1)))
  (reduce concat
    (empty first-item)
    (subseq- buffer-range 
      (as (Int 0 255) 
        (unwrap-panic (index-of buffer-range first-item))) 
      (as (Int 0 255) 
        (unwrap-panic (index-of buffer-range last-item))))))
        
(test= 
  (range-buff 0x01 0x03)
  0x010203)

(define-constant ascii-range (range- " " "~"))

(define-read-only (range-ascii 
                    (first-item (String 1 ascii)) 
                    (last-item (String 1 ascii)))
  (reduce concat
    (empty first-item)
    (subseq- ascii-range 
      (as (Int 0 255) 
        (unwrap-panic (index-of ascii-range first-item))) 
      (as (Int 0 255) 
        (unwrap-panic (index-of ascii-range last-item))))))
        
(test= 
  (range-ascii "c" "g")
  "cdefg")

;;
