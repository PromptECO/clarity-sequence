;; TEST REVERSE

(use {reverse, reverse-uint, reverse-buff, reverse-string, reverse-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.reverse7-00)

(reverse (list 1 2 3))

(reverse-uint (list u1 u2 u3))

(reverse-buff 0x112233)

(reverse-string u"abcdef")

(reverse-ascii "abcdef")

;;
