;; REPLACE

(define-constant max-len (- (pow 2 7) 1))

(define-private (for-step-integer-list-list
                 (item int)
                 (org (list 127 int))
                 (rep (list 127 int)))
 (match (index-of org item)
  ix (unwrap-panic
      (element-at rep ix))
  item))

(define-private (repeat127-list
                 (x (list 127 int)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (repeat127-list1
                 (x (list 127 int)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (replace-list-list-list
                 (seq (list 127 int))
                 (org (list 127 int))
                 (rep (list 127 int)))
 (let ((item seq))
  (map for-step-integer-list-list item
   (repeat127-list org)
   (repeat127-list1 rep))))

(define-read-only (replace
                   (seq (list 127 int))
                   (org (list 127 int))
                   (rep (list 127 int)))
 (replace-list-list-list seq org rep))

(define-private (for-step-unsigned-list-list
                 (item uint)
                 (org (list 127 uint))
                 (rep (list 127 uint)))
 (match (index-of org item)
  ix (unwrap-panic
      (element-at rep ix))
  item))

(define-private (repeat127-list2
                 (x (list 127 uint)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (repeat127-list3
                 (x (list 127 uint)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (replace-list-list-list1
                 (seq (list 127 uint))
                 (org (list 127 uint))
                 (rep (list 127 uint)))
 (let ((item seq))
  (map for-step-unsigned-list-list item
   (repeat127-list2 org)
   (repeat127-list3 rep))))

(define-read-only (replace-uint
                   (seq (list 127 uint))
                   (org (list 127 uint))
                   (rep (list 127 uint)))
 (replace-list-list-list1 seq org rep))

(define-private (for-step-bool-list-list
                 (item bool)
                 (org (list 127 bool))
                 (rep (list 127 bool)))
 (match (index-of org item)
  ix (unwrap-panic
      (element-at rep ix))
  item))

(define-private (repeat127-list4
                 (x (list 127 bool)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (repeat127-list5
                 (x (list 127 bool)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (replace-list-list-list2
                 (seq (list 127 bool))
                 (org (list 127 bool))
                 (rep (list 127 bool)))
 (let ((item seq))
  (map for-step-bool-list-list item
   (repeat127-list4 org)
   (repeat127-list5 rep))))

(define-read-only (replace-bool
                   (seq (list 127 bool))
                   (org (list 127 bool))
                   (rep (list 127 bool)))
 (replace-list-list-list2 seq org rep))

(define-private (reducer-buffer-buffer
                 (item4 (buff 1))
                 (acc (buff 127)))
 (unwrap-panic
  (as-max-len?
   (concat acc item4)
   u127)))

(define-private (for-step-buffer-buffer-buffer
                 (item (buff 1))
                 (org (buff 127))
                 (rep (buff 127)))
 (match (index-of org item)
  ix (unwrap-panic
      (element-at rep ix))
  item))

(define-private (repeat127-buffer
                 (x (buff 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (repeat127-buffer1
                 (x (buff 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (replace-buffer-buffer-buffer
                 (seq (buff 127))
                 (org (buff 127))
                 (rep (buff 127)))
 (let ((item seq))
  (map for-step-buffer-buffer-buffer item
   (repeat127-buffer org)
   (repeat127-buffer1 rep))))

(define-private (replace-cat-buffer-buffer-buffer
                 (seq (buff 127))
                 (org (buff 127))
                 (rep (buff 127)))
 (let ((init 0x))
  (fold reducer-buffer-buffer
   (replace-buffer-buffer-buffer seq org rep) init)))

(define-read-only (replace-buff
                   (seq (buff 127))
                   (org (buff 127))
                   (rep (buff 127)))
 (replace-cat-buffer-buffer-buffer seq org rep))

(define-private (reducer-1-string-string
                 (item4 (string-utf8 1))
                 (acc (string-utf8 127)))
 (unwrap-panic
  (as-max-len?
   (concat acc item4)
   u127)))

(define-private (for-step-string-string-string
                 (item (string-utf8 1))
                 (org (string-utf8 127))
                 (rep (string-utf8 127)))
 (match (index-of org item)
  ix (unwrap-panic
      (element-at rep ix))
  item))

(define-private (repeat127-string
                 (x (string-utf8 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (repeat127-string1
                 (x (string-utf8 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (replace-string-string-string
                 (seq (string-utf8 127))
                 (org (string-utf8 127))
                 (rep (string-utf8 127)))
 (let ((item seq))
  (map for-step-string-string-string item
   (repeat127-string org)
   (repeat127-string1 rep))))

(define-private (replace-cat-string-string-string
                 (seq (string-utf8 127))
                 (org (string-utf8 127))
                 (rep (string-utf8 127)))
 (let ((init1 u""))
  (fold reducer-1-string-string
   (replace-string-string-string seq org rep) init1)))

(define-read-only (replace-string
                   (seq (string-utf8 127))
                   (org (string-utf8 127))
                   (rep (string-utf8 127)))
 (replace-cat-string-string-string seq org rep))

(define-private (reducer-2-string-string
                 (item4 (string-ascii 1))
                 (acc (string-ascii 127)))
 (unwrap-panic
  (as-max-len?
   (concat acc item4)
   u127)))

(define-private (for-step-string-string-string1
                 (item (string-ascii 1))
                 (org (string-ascii 127))
                 (rep (string-ascii 127)))
 (match (index-of org item)
  ix (unwrap-panic
      (element-at rep ix))
  item))

(define-private (repeat127-string2
                 (x (string-ascii 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (repeat127-string3
                 (x (string-ascii 127)))
 (list
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x
  x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x x))

(define-private (replace-string-string-string1
                 (seq (string-ascii 127))
                 (org (string-ascii 127))
                 (rep (string-ascii 127)))
 (let ((item seq))
  (map for-step-string-string-string1 item
   (repeat127-string2 org)
   (repeat127-string3 rep))))

(define-private (replace-cat-string-string-string1
                 (seq (string-ascii 127))
                 (org (string-ascii 127))
                 (rep (string-ascii 127)))
 (let ((init2 ""))
  (fold reducer-2-string-string
   (replace-string-string-string1 seq org rep) init2)))

(define-read-only (replace-ascii
                   (seq (string-ascii 127))
                   (org (string-ascii 127))
                   (rep (string-ascii 127)))
 (replace-cat-string-string-string1 seq org rep))

;;
