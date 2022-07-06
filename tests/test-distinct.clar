;; TEST DISTINCT

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00 distinct (list 1 2 3 3 2 1 4 5))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00 distinct-uint (list u1 u2 u3 u1 u4 u2))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00 distinct-bool (list false true true false))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00 distinct-buff 0x112233221144)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00 distinct-string u"abccbae")

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00 distinct-ascii "abccbae")

;;
