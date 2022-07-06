;; INTERLEAVE 

(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (interleave- seq1 seq2)
  (reduce concat 
    (empty seq1) 
    (map list seq1 seq2)))

(define-read-only (interleave 
                    (seq1 (List max-len int))
                    (seq2 (List max-len int)))
  (interleave- seq1 seq2))

(test=
  (interleave (list 1 2 3 4) (list 5 6 7 8))
  (list 1 5 2 6 3 7 4 8))


(define-read-only (interleave-uint 
                    (seq1 (List max-len uint))
                    (seq2 (List max-len uint)))
  (interleave- seq1 seq2))

(test=
  (interleave-uint (list u1 u2 u3 u4) (list u5 u6 u7 u8))
  (list u1 u5 u2 u6 u3 u7 u4 u8))

(define-read-only (interleave-bool 
                    (seq1 (List max-len bool))
                    (seq2 (List max-len bool)))
  (interleave- seq1 seq2))

(test=
  (interleave-bool (list true true) (list false true))
  (list true false true true))

;;
