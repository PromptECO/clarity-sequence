;; TEST KEEP-SOME

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.keep-some7-00 keep-some (list (some 1) none (some 2) none))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.keep-some7-00 keep-uint (list (some u1) none (some u2) none))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.keep-some7-00 keep-bool (list (some true) none (some false)))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.keep-some7-00 keep-buff (list (some 0x00) (some 0x01) none))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.keep-some7-00 keep-string (list (some u"hello") none (some u"world")))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.keep-some7-00 keep-ascii (list (some "hello") none (some "world")))

;;
