;; TEST INTERLEAVE

(use {interleave, interleave-uint, interleave-bool} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.distinct7-00)

(interleave (list 1 2 3 4) (list 5 6 7 8))

(interleave-uint (list u1 u2 u3 u4) (list u5 u6 u7 u8))

(interleave-bool (list true true) (list false true))

;;
