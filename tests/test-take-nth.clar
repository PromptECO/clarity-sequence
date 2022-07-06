;; TEST TAKE-NTH

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take-nth7-00 take-nth 3 (list 1 2 3 4 5 6 7 8 9))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take-nth7-00 take-nth-uint 3 (list u1 u2 u3 u4 u5 u6 u7 u8 u9))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take-nth7-00 take-nth-bool 2 (list true false false true))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take-nth7-00 take-nth-buff 2 0x01024269)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take-nth7-00 take-nth-string 2 u"abcdef")

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.take-nth7-00 take-nth-ascii 2 "abcdef")

;;
