;; TAKE-NTH 

(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (take-nth- (step Len) seq)
  (for ((g (range 0 (min step (/ (- (to-int (len seq)) 1)
                                 (max step 1))))))
    (unwrap-panic 
      (element-at seq 
        (to-uint (* g step))))))

(define-read-only (take-nth 
                    (step Len)
                    (seq (List max-len Int)))
  (take-nth- step seq))

(test=
  (take-nth 3 (list 1 2 3 4 5 6 7 8 9))
  (list 1 4 7))

(define-read-only (take-nth-uint 
                    (step Len)
                    (seq (List max-len Uint)))
  (take-nth- step seq))

(test=
  (take-nth-uint 3 (list u1 u2 u3 u4 u5 u6 u7 u8 u9))
  (list u1 u4 u7))

(define-read-only (take-nth-bool 
                    (step Len)
                    (seq (List max-len Bool)))
  (take-nth- step seq))

(test=
  (take-nth-bool 2 (list true false false true))
  (list true false))

(define-read-only (take-nth-buff 
                    (step Len)
                    (seq (Buffer max-len)))
  (take-nth- step seq))

(test=
  (take-nth-buff 2 0x01024269)
  (list 0x01 0x42))

(define-read-only (take-nth-string 
                    (step Len)
                    (seq (String max-len)))
  (take-nth- step seq))

(test=
  (take-nth-string 2 u"abcdef")
  (list u"a" u"c" u"e"))
    
(define-read-only (take-nth-ascii 
                    (step Len)
                    (seq (String max-len ascii)))
  (take-nth- step seq))
  
(test=
  (take-nth-ascii 2 "abcdef")
  (list "a" "c" "e"))

;;
