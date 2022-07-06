;; TEST REPEAT

(use {repeat, repeat-uint, repeat-bool, repeat-buff, repeat-string, repeat-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.repeat7-00)

(repeat 3 0)

(repeat-uint 8 u42)

(repeat-bool 3 true)

(repeat-buff 3 0x42)

(repeat-string 3 u"z")

(repeat-ascii 3 "x")

;;
