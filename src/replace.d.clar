;; REPLACE

(import {repeat: repeat-
         range: range-})
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (replace- seq org rep)
  (for ((item seq))
    (match (index-of org item)
      ix (unwrap-panic 
           (element-at rep ix))
      item)))

(define-read-only (replace
                    (seq (List max-len Int))
                    (org (List max-len Int))
                    (rep (List max-len Int)))                   
  (replace- seq org rep))

(test=
  (replace (list 1 2 3 4 5 6) (list 3 5) (list -3 -5))
  (list 1 2 -3 4 -5 6))
  
(define-read-only (replace-uint
                    (seq (List max-len Uint))
                    (org (List max-len Uint))
                    (rep (List max-len Uint)))
  (replace- seq org rep))

(define-read-only (replace-bool  
                    (seq (List max-len Bool))
                    (org (List max-len Bool))
                    (rep (List max-len Bool)))
  (replace- seq org rep))

(define (replace-cat seq org rep)
  (reduce concat
    (empty seq)
    (replace- seq org rep)))

(define-read-only (replace-buff 
                    (seq (Buffer max-len))
                    (org (Buffer max-len))
                    (rep (Buffer max-len)))
  (replace-cat seq org rep))

(test=
  (replace-buff 0x112233445566 0x3355 0x0000)
  0x112200440066)

(define-read-only (replace-string 
                    (seq (String max-len))
                    (org (String max-len))
                    (rep (String max-len)))
  (replace-cat seq org rep))
    
(define-read-only (replace-ascii 
                    (seq (String max-len ascii))
                    (org (String max-len ascii))
                    (rep (String max-len ascii)))
  (replace-cat seq org rep))

(test=
  (replace-ascii "hello world" "eo" "xy")
  "hxlly wyrld")

;;
