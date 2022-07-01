;; KEEP-SOME

(define-constant max-len (- (pow 2 7) 1))

(define-private (unwrap-panic-
                 (item1 (optional int)))
 (unwrap-panic item1))

(define-private (is-some-
                 (item1 (optional int)))
 (is-some item1))

(define-private (keep-some-list
                 (seq (list 127 (optional int))))
 (map unwrap-panic- (filter is-some- seq)))

(define-read-only (keep-some (seq (list 127 (optional int))))
 (keep-some-list seq))

(define-private (unwrap-panic-1-
                 (item1 (optional uint)))
 (unwrap-panic item1))

(define-private (is-some-1-
                 (item1 (optional uint)))
 (is-some item1))

(define-private (keep-some-list1
                 (seq (list 127 (optional uint))))
 (map unwrap-panic-1- (filter is-some-1- seq)))

(define-read-only (keep-uint (seq (list 127 (optional uint))))
 (keep-some-list1 seq))

(define-private (unwrap-panic-2-
                 (item1 (optional bool)))
 (unwrap-panic item1))

(define-private (is-some-2-
                 (item1 (optional bool)))
 (is-some item1))

(define-private (keep-some-list2
                 (seq (list 127 (optional bool))))
 (map unwrap-panic-2- (filter is-some-2- seq)))

(define-read-only (keep-bool (seq (list 127 (optional bool))))
 (keep-some-list2 seq))

(define-private (unwrap-panic-3-
                 (item1 (optional (buff 127))))
 (unwrap-panic item1))

(define-private (is-some-3-
                 (item1 (optional (buff 127))))
 (is-some item1))

(define-private (keep-some-list3
                 (seq (list 127 (optional (buff 127)))))
 (map unwrap-panic-3- (filter is-some-3- seq)))

(define-read-only (keep-buff (seq (list 127 (optional (buff 127)))))
 (keep-some-list3 seq))

(define-private (unwrap-panic-4-
                 (item1 (optional (string-utf8 127))))
 (unwrap-panic item1))

(define-private (is-some-4-
                 (item1 (optional (string-utf8 127))))
 (is-some item1))

(define-private (keep-some-list4
                 (seq (list 127 (optional (string-utf8 127)))))
 (map unwrap-panic-4- (filter is-some-4- seq)))

(define-read-only (keep-string (seq (list 127 (optional (string-utf8 127)))))
 (keep-some-list4 seq))

(define-private (unwrap-panic-5-
                 (item1 (optional (string-ascii 127))))
 (unwrap-panic item1))

(define-private (is-some-5-
                 (item1 (optional (string-ascii 127))))
 (is-some item1))

(define-private (keep-some-list5
                 (seq (list 127 (optional (string-ascii 127)))))
 (map unwrap-panic-5- (filter is-some-5- seq)))

(define-read-only (keep-ascii (seq (list 127 (optional (string-ascii 127)))))
 (keep-some-list5 seq))

;;
