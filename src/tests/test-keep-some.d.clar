;; TEST KEEP-SOME

(use {keep-some, keep-uint, keep-bool, keep-buff, keep-string, keep-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.slice7-01)

(keep-some (list (some 1) none (some 2) none))

(keep-uint (list (some u1) none (some u2) none))

(keep-bool (list (some true) none (some false)))

(keep-buff (list (some 0x00) (some 0x01) none))

(keep-string (list (some u"hello") none (some u"world")))

(keep-ascii (list (some "hello") none (some "world")))

;;
