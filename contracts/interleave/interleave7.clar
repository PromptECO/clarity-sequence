;; INTERLEAVE

(define-constant max-len (- (pow 2 7) 1))

(define-private (reducer-list-list
                 (item (list 2 int))
                 (acc (list 254 int)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u254)))

(define-private (list-
                 (item1 int)
                 (item2 int))
 (list item1 item2))

(define-private (interleave-list-list
                 (seq1 (list 127 int))
                 (seq2 (list 127 int)))
 (let ((init (list)))
  (fold reducer-list-list
   (map list- seq1 seq2) init)))

(define-read-only (interleave
                   (seq1 (list 127 int))
                   (seq2 (list 127 int)))
 (interleave-list-list seq1 seq2))

(define-private (reducer-1-list-list
                 (item (list 2 uint))
                 (acc (list 254 uint)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u254)))

(define-private (list-1-
                 (item1 uint)
                 (item2 uint))
 (list item1 item2))

(define-private (interleave-list-list1
                 (seq1 (list 127 uint))
                 (seq2 (list 127 uint)))
 (let ((init1 (list)))
  (fold reducer-1-list-list
   (map list-1- seq1 seq2) init1)))

(define-read-only (interleave-uint
                   (seq1 (list 127 uint))
                   (seq2 (list 127 uint)))
 (interleave-list-list1 seq1 seq2))

(define-private (reducer-2-list-list
                 (item (list 2 bool))
                 (acc (list 254 bool)))
 (unwrap-panic
  (as-max-len?
   (concat acc item)
   u254)))

(define-private (list-2-
                 (item1 bool)
                 (item2 bool))
 (list item1 item2))

(define-private (interleave-list-list2
                 (seq1 (list 127 bool))
                 (seq2 (list 127 bool)))
 (let ((init2 (list)))
  (fold reducer-2-list-list
   (map list-2- seq1 seq2) init2)))

(define-read-only (interleave-bool
                   (seq1 (list 127 bool))
                   (seq2 (list 127 bool)))
 (interleave-list-list2 seq1 seq2))

;;
