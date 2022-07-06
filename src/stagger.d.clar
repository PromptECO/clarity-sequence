;; STAGGER 

(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (stagger- (n Len) (step Len) seq)
  (for ((g (range 0 (- (/ (- (as Len (len seq)) 1)
                          (max step 1))
                       1))))
    (map unwrap-panic
      (filter is-some
        (for ((i (range 0 (- n 1))))
          (element-at seq 
            (to-uint (+ (* g step) i))))))))

(define-read-only (stagger 
                    (n Len)
                    (step Len)
                    (seq (List max-len int)))
  (stagger- n step seq))

(test=
  (stagger 3 2 (list 1 2 3 4 5 6 7 8 9))
  (list (list 1 2 3) (list 3 4 5) (list 5 6 7) (list 7 8 9)))


(define-read-only (stagger-uint 
                    (n Len) 
                    (step Len)
                    (seq (List max-len uint)))
  (stagger- n step seq))

(test=
  (stagger-uint 3 2 (list u1 u2 u3 u4 u5 u6 u7 u8 u9))
  (list (list u1 u2 u3) (list u3 u4 u5) (list u5 u6 u7) (list u7 u8 u9)))

(define-read-only (stagger-bool 
                    (n Len)
                    (step Len)
                    (seq (List max-len bool)))
  (stagger- n step seq))

(test=
  (stagger-bool 2 1 (list true false false true))
  (list (list true false) (list false false) (list false true)))

(define-read-only (stagger-buff 
                    (n Len) 
                    (step Len)
                    (seq (Buffer max-len)))
  (stagger- n step seq))

(test=
  (stagger-buff 2 1 0x01024269)
  (list (list 0x01 0x02) (list 0x02 0x42) (list 0x42 0x69)))

(define-read-only (stagger-string 
                    (n Len) 
                    (step Len)
                    (seq (String max-len)))
  (stagger- n step seq))

(test=
  (stagger-string 2 1 u"abcd")
  (list (list u"a" u"b") (list u"b" u"c") (list u"c" u"d")))
  

(define-read-only (stagger-ascii 
                    (n Len) 
                    (step Len)
                    (seq (String max-len ascii)))
  (stagger- n step seq))

(test=
  (stagger-ascii 2 1 "abcd")
  (list (list "a" "b") (list "b" "c") (list "c" "d")))

;;
