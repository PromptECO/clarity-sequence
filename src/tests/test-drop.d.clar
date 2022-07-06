;; TEST DROP

(use {drop, drop-uint, drop-bool, drop-buff, drop-string, drop-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.drop7-00)

(drop 3 (list 1 2 3 4 5))

(drop-uint 3 (list u1 u2 u3 u4 u5))

(drop-bool 2 (list false true true false))

(drop-buff 3 0x1122334455)

(drop-string 3 u"abcdef")

(drop-ascii 3 "abcdef")

;;
