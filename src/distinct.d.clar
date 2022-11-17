;; DISTINCT 
 
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (distinct-redux item result)
  (as result
    (if (is-none (index-of result item))
      (append result item)
      result)))

(define (distinct- seq)
  (fold distinct-redux
    seq (empty seq)))

(define-read-only (distinct (seq (List max-len Int)))
  (distinct- seq))

(test=
  (distinct (list 1 2 3 4 3 2 1))
  (list 1 2 3 4))

(define-read-only (distinct-uint (seq (List max-len Uint)))
  (distinct- seq))

(test=
  (distinct-uint (list u1 u2 u3 u4 u3 u2 u1))
  (list u1 u2 u3 u4))

(define-read-only (distinct-bool (seq (List max-len bool)))
  (distinct- seq))

(test=
  (distinct-bool (list true false false true))
  (list true false))

(define (distinct-cat-redux item result)
  (as result
    (match (index-of result item)
      ix result
      (concat result item))))

(define (distinct-cat seq)
  (fold distinct-cat-redux
    seq
    (empty seq)))

(define-read-only (distinct-buff (seq (Buffer max-len)))
  (distinct-cat seq))

(test= 
  (distinct-buff 0x0101020103)
  0x010203)

(define-read-only (distinct-string (seq (String max-len)))
  (distinct-cat seq))

(test=
  (distinct-string u"12333421")
  u"1234")

(define-read-only (distinct-ascii (seq (String max-len ascii)))
  (distinct-cat seq))

(test=
  (distinct-ascii "12333421")
  "1234")
  
