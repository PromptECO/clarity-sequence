;; TEST PARTITION

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.partition7-00 partition 3 (list 1 2 3 4 5 6 7 8 9))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.partition7-00 partition-uint 3 (list u1 u2 u3 u4 u5 u6 u7 u8 u9))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.partition7-00 partition-bool 2 (list true false false true))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.partition7-00 partition-buff 2 0x01024269)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.partition7-00 partition-string 2 u"abcdef")

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.partition7-00 partition-ascii 3 "abcdef")

;;
