;; CONVERT

(define-constant max-len (- (pow 2 7) 1))

(define-constant ascii-range 
  " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~")

(define-constant buffer-range (range 0x00 0xFF))

(define-read-only (char-to-int (item (String 1 ascii)))
  (+ 32 (as Int (unwrap-panic (index-of ascii-range item)))))

(define-read-only (int-to-char (item Int))
  (unwrap-panic (element-at ascii-range (- item 32))))

(define-read-only (buff-to-int (item (Buffer 1)))
  (as Int (unwrap-panic (index-of buffer-range item))))

(define-read-only (int-to-buff (item Int))
  (unwrap-panic (element-at buffer-range item)))

(define-read-only (ascii-to-buff (seq (String max-len ascii)))
  (reduce concat 0x (map int-to-buff (map char-to-int seq))))

(test= 
  (ascii-to-buff "abc")
  0x616263)

(define-read-only (buff-to-ascii (seq (Buffer max-len)))
  (reduce concat "" (map int-to-char (map buff-to-int seq))))

(test= 
  (buff-to-ascii 0x616263)
  "abc")

;;
