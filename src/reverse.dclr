;; REVERSE
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (reverse-redx item seq)
  (as seq 
    (if (is (List max-len) seq)
      (concat (list item) seq)
      (concat item seq))))

(define (reverse- seq)
  (fold reverse-redx seq (empty seq)))
  
(define-read-only (reverse (seq (List max-len Int)))
  (reverse- seq))

(test= 
  (reverse (list 1 2 3))
  (list 3 2 1))
  
(define-read-only (reverse-uint (seq (List max-len Uint)))
  (reverse- seq))

(test= 
  (reverse-uint (list u1 u2 u3))
  (list u3 u2 u1))

(define-read-only (reverse-buff (seq (Buffer max-len)))
   (reverse- seq))

(test= 
  (reverse-buff 0x112233)
  0x332211)

(define-read-only (reverse-string (seq (String max-len)))
   (reverse- seq))

(test= 
  (reverse-string u"abcdef")
  u"fedcba")

(define-read-only (reverse-ascii (seq (String max-len ascii)))
   (reverse- seq))

(test= 
  (reverse-ascii "abcdef")
  "fedcba")
