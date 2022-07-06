;; DISTINCT

(define-constant max-len (- (pow 2 7) 1))

(define-private (distinct-redux-integer-list
                 (item int)
                 (result (list 127 int)))
 (unwrap-panic
  (as-max-len?
   (match (index-of result item)
    ix result
    (append result item))
   u127)))

(define-private (distinct-list
                 (seq (list 127 int)))
 (fold distinct-redux-integer-list
  seq (list)))

(define-read-only (distinct (seq (list 127 int)))
 (distinct-list seq))

(define-private (distinct-redux-unsigned-list
                 (item uint)
                 (result (list 127 uint)))
 (unwrap-panic
  (as-max-len?
   (match (index-of result item)
    ix result
    (append result item))
   u127)))

(define-private (distinct-list1
                 (seq (list 127 uint)))
 (fold distinct-redux-unsigned-list
  seq (list)))

(define-read-only (distinct-uint (seq (list 127 uint)))
 (distinct-list1 seq))

(define-private (distinct-redux-bool-list
                 (item bool)
                 (result (list 127 bool)))
 (unwrap-panic
  (as-max-len?
   (match (index-of result item)
    ix result
    (append result item))
   u127)))

(define-private (distinct-list2
                 (seq (list 127 bool)))
 (fold distinct-redux-bool-list
  seq (list)))

(define-read-only (distinct-bool (seq (list 127 bool)))
 (distinct-list2 seq))

(define-private (distinct-cat-redux-buffer-buffer
                 (item (buff 1))
                 (result (buff 127)))
 (unwrap-panic
  (as-max-len?
   (match (index-of result item)
    ix result
    (concat result item))
   u127)))

(define-private (distinct-cat-buffer
                 (seq (buff 127)))
 (fold distinct-cat-redux-buffer-buffer
  seq
  0x))

(define-read-only (distinct-buff (seq (buff 127)))
 (distinct-cat-buffer seq))

(define-private (distinct-cat-redux-string-string
                 (item (string-utf8 1))
                 (result (string-utf8 127)))
 (unwrap-panic
  (as-max-len?
   (match (index-of result item)
    ix result
    (concat result item))
   u127)))

(define-private (distinct-cat-string
                 (seq (string-utf8 127)))
 (fold distinct-cat-redux-string-string
  seq
  u""))

(define-read-only (distinct-string (seq (string-utf8 127)))
 (distinct-cat-string seq))

(define-private (distinct-cat-redux-string-string1
                 (item (string-ascii 1))
                 (result (string-ascii 127)))
 (unwrap-panic
  (as-max-len?
   (match (index-of result item)
    ix result
    (concat result item))
   u127)))

(define-private (distinct-cat-string1
                 (seq (string-ascii 127)))
 (fold distinct-cat-redux-string-string1
  seq
  ""))

(define-read-only (distinct-ascii (seq (string-ascii 127)))
 (distinct-cat-string1 seq))
 
