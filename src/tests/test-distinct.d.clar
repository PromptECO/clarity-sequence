;; TEST DISTINCT

(use {distinct, distinct-uint, distinct-bool, distinct-buff, distinct-string, distinct-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00)

(distinct (list 1 2 3 3 2 1 4 5))

(distinct-uint (list u1 u2 u3 u1 u4 u2))

(distinct-bool (list false true true false))

(distinct-buff 0x112233221144)

(distinct-string u"abccbae")

(distinct-ascii "abccbae")

;;
