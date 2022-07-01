;; INTERPOSE 

(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (interpose- sep seq)
  (append
    (reduce concat
      (list)
      (map list seq (repeat (- (as Len (len seq)) 1) sep)))
    (unwrap-panic
      (element-at seq (- (len seq) u1)))))

(define-read-only (interpose 
                    (sep Int)
                    (seq (List max-len Int)))
  (interpose- sep seq))

(test=
  (interpose 0 (list 1 2 3))
  (list 1 0 2 0 3))

(define-read-only (interpose-uint 
                    (sep Uint)
                    (seq (List max-len Uint)))
  (interpose- sep seq))

(test=
  (interpose-uint u0 (list u1 u2 u3))
  (list u1 u0 u2 u0 u3))

(define-read-only (interpose-bool 
                    (sep Bool)
                    (seq (List max-len Bool)))
  (interpose- sep seq))

(test=
  (interpose-bool true (list false false false))
  (list false true false true false))

;;
