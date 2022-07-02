;; TEST SLICE

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01 slice (list 1 2 3 4 5 6 7) 2 3)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01 slice-uint (list u1 u2 u3 u4 u5 u6 u7) 2 3)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01 slice-bool (list false true true false) 1 2)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01 slice-buff 0x11223344556677 2 3)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01 slice-string u"abcdefg" 2 3)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01 slice-ascii "abcdefg" 2 3)

;;
