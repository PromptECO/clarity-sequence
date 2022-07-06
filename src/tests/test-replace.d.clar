;; TEST REPLACE

(use {replace, replace-uint, replace-bool, replace-buff, replace-string, replace-ascii} 
  'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.replace7-00)

(replace (list 1 2 3 4 5 6) (list 3 5) (list -3 -5))

(replace-uint (list u1 u2 u3 u4 u5 u6) (list u3 u5) (list u33 u55))

(replace-buff 0x112233445566 0x3355 0x0000)

(replace-string u"hxlly wyrld" u"xy" u"eo")

(replace-ascii "hxlly wyrld" "xy" "eo")

;;
