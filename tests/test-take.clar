;; TEST TAKE

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take7-00 take 3 (list 1 2 3 4 5 6))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take7-00 take-uint 3 (list u1 u2 u3 u4 u5 u6))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take7-00 take-bool 3 (list true false true false))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take7-00 take-buff 3 0x112233445566)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take7-00 take-string 3 u"abcdef")

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take7-00 take-ascii 3 "abcdef")

;;
