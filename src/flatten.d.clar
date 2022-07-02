;; FLATTEN

(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (flatten- seq)
  (reduce concat (list) seq))

(define-read-only (flatten
                    (seq (List max-len (List max-len int))))
  (flatten- seq))

(test=
  (flatten (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
  (list 1 2 3 4 5 6 7 8 9))


(define-read-only (flatten-uint 
                    (seq (List max-len (List max-len uint))))
  (flatten- seq))

(test=
  (flatten-uint (list (list u1 u2 u3) (list u4 u5 u6) (list u7 u8 u9)))
  (list u1 u2 u3 u4 u5 u6 u7 u8 u9))
(define-read-only (flatten-bool 
                    (seq (List max-len (List max-len bool))))
   (flatten- seq))

(test=
  (flatten-bool (list (list true false) (list false true)))
  (list true false false true))

;;
