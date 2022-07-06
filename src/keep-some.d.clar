;; KEEP-SOME 
  
(define-constant max-len (- (pow 2 7) 1))

(define-type-alias Len (Int 0 max-len))

(define (keep-some- seq)
  (map unwrap-panic (filter is-some seq)))

(define-read-only (keep-some (seq (List max-len (Option Int))))
  (keep-some- seq))

(test=
  (keep-some (list (some 1) none (some 2) none))
  (list 1 2))
  
(define-read-only (keep-uint (seq (List max-len (Option Uint))))
  (keep-some- seq))

(test=
  (keep-uint (list (some u1) none (some u2) none))
  (list u1 u2))

(define-read-only (keep-bool (seq (List max-len (Option Bool))))
  (keep-some- seq))

(test=
  (keep-bool (list (some true) none (some false)))
  (list true false))

(define-read-only (keep-buff (seq (List max-len (Option (Buffer max-len)))))
  (keep-some- seq))

(test= 
  (keep-buff (list (some 0x00) (some 0x01) none)))

(define-read-only (keep-string (seq (List max-len (Option (String max-len)))))
  (keep-some- seq))

(test= 
  (keep-string (list (some u"hello") none (some u"world")))
  (list u"hello" u"world"))

(define-read-only (keep-ascii (seq (List max-len (Option (String max-len ascii)))))
  (keep-some- seq))

(test= 
  (keep-ascii (list (some "hello") none (some "world")))
  (list "hello" "world"))

;;
