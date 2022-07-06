;; TEST REPLACE

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.replace7-00 replace (list 1 2 3 4 5 6) (list 3 5) (list -3 -5))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.replace7-00 replace-uint (list u1 u2 u3 u4 u5 u6) (list u3 u5) (list u33 u55))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.replace7-00 replace-bool (list true false false true) (list false true) (list true false))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.replace7-00 replace-buff 0x112233445566 0x3355 0x0000)

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.replace7-00 replace-string u"hxlly wyrld" u"xy" u"eo")

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.replace7-00 replace-ascii "hxlly wyrld" "xy" "eo")

;;
