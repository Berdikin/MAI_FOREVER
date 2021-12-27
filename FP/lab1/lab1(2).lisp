(defun exchange (n a b)
	(cond ((= (mod n 3) 0) (values (+ a (/ n 3)) b))
	      ((= (mod n 5) 0) (values a (+ b (/ n 5))))
	      (T (exchange (- n 5) a (+ b 1)))))


(defun change (n)
  (exchange n 0 0))
