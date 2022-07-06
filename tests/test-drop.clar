;; TEST DROP

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.drop7-00 drop 3 (list 1 2 3 4 5))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.drop7-00 drop-uint 3 (list u1 u2 u3 u4 u5))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.drop7-00 drop-bool 2 (list false true true false))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.drop7-00 drop-buff 3 0x1122334455)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.drop7-00 drop-string 3 u"abcdef")

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.drop7-00 drop-ascii 3 "abcdef")

;;
