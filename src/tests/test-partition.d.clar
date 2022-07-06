;; TEST PARTITION

(use {partition, partition-uint, partition-bool, partition-buff, partition-string, partition-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.partition7-00)

(partition 3 (list 1 2 3 4 5 6 7 8 9))

(partition-uint 3 (list u1 u2 u3 u4 u5 u6 u7 u8 u9))

(partition-bool 2 (list true false false true))

(partition-buff 2 0x01024269)

(partition-string 2 u"abcdef")

(partition-ascii 3 "abcdef")

;;
