;; TEST STAGGER

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.stagger7-00 stagger 3 2 (list 1 2 3 4 5 6 7 8 9))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.stagger7-00 stagger-uint 3 2 (list u1 u2 u3 u4 u5 u6 u7 u8 u9))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.stagger7-00 stagger-bool 2 1 (list true false false true))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.stagger7-00 stagger-buff 2 1 0x01024269)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.stagger7-00 stagger-string 2 1 u"abcd")

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.stagger7-00 stagger-ascii 2 1 "abcd")

;;
