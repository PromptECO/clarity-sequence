;; TEST TAKE

(use {take, take-uint, take-bool, take-buff, take-string, take-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take7-00)

(take 3 (list 1 2 3 4 5 6))

(take-uint 3 (list u1 u2 u3 u4 u5 u6))

(take-bool 3 (list true false true false))

(take-buff 3 0x112233445566)

(take-string 3 u"abcdef")

(take-ascii 3 "abcdef")

;;
