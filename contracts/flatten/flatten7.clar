;; FLATTEN

(define-constant max-len (- (pow 2 7) 1))

(define-private (reducer-list-list
                 (item (list 127 int))
                 (acc (list 16129 int)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u16129)))

(define-private (flatten-list
                 (seq (list 127 (list 127 int))))
 (let ((init (list)))
  (fold reducer-list-list seq init)))

(define-read-only (flatten
                   (seq (list 127 (list 127 int))))
 (flatten-list seq))

(define-private (reducer-1-list-list
                 (item (list 127 uint))
                 (acc (list 16129 uint)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u16129)))

(define-private (flatten-list1
                 (seq (list 127 (list 127 uint))))
 (let ((init1 (list)))
  (fold reducer-1-list-list seq init1)))

(define-read-only (flatten-uint
                   (seq (list 127 (list 127 uint))))
 (flatten-list1 seq))

(define-private (reducer-2-list-list
                 (item (list 127 bool))
                 (acc (list 16129 bool)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u16129)))

(define-private (flatten-list2
                 (seq (list 127 (list 127 bool))))
 (let ((init2 (list)))
  (fold reducer-2-list-list seq init2)))

(define-read-only (flatten-bool
                   (seq (list 127 (list 127 bool))))
 (flatten-list2 seq))

;;
