;; TEST FLATTEN

(use {flatten, flatten-uint, flatten-bool} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.flatten7-00)

(flatten (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(flatten-uint (list (list u1 u2 u3) (list u4 u5 u6) (list u7 u8 u9)))

(flatten-bool (list (list true false) (list false true)))

;;
