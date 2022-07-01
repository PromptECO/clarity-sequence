;; PARTITION 

(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (partition- (n Len) seq)
  (for ((g (range 0 (min n (/ (- (to-int (len seq)) 1)
                              (max n 1))))))
    (map unwrap-panic
      (filter is-some
        (for ((i (range 0 (- n 1))))
          (element-at seq 
            (to-uint (+ (* g n) i))))))))

(define-read-only (partition 
                    (n Len) 
                    (seq (List max-len int)))
  (partition- n seq))

(test=
  (partition 3 (list 1 2 3 4 5 6 7 8 9))
  (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))


(define-read-only (partition-uint 
                    (n Len) 
                    (seq (List max-len uint)))
  (partition- n seq))

(test=
  (partition-uint 3 (list u1 u2 u3 u4 u5 u6 u7 u8 u9))
  (list (list u1 u2 u3) (list u4 u5 u6) (list u7 u8 u9)))

(define-read-only (partition-bool 
                    (n Len) 
                    (seq (List max-len bool)))
  (partition- n seq))

(test=
  (partition-bool 2 (list true false false true))
  (list (list true false) (list false true)))

(define-read-only (partition-buff 
                    (n Len) 
                    (seq (Buffer max-len)))
  (partition- n seq))

(test=
  (partition-buff 2 0x01024269)
  (list (list 0x01 0x02) (list 0x42 0x69)))

(define-read-only (partition-string 
                    (n Len) 
                    (seq (String max-len)))
  (partition- n seq))

(define-read-only (partition-ascii 
                    (n Len) 
                    (seq (String max-len ascii)))
  (partition- n seq))

;;
