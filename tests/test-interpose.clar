;; TEST INTERPOSE

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.interpose7-00 interpose 0 (list 1 2 3))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.interpose7-00 interpose-uint u0 (list u1 u2 u3))

(contract-call? 'ST165C6WB01M6CYJ2ZZESYBF51KQ01SVW3P7D1KM2.interpose7-00 interpose-bool true (list false false false))

;;
