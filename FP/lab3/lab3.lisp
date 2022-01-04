(defun swap-columns(matrix)
    (let ((n (first (array-dimensions matrix)))
          (m (second (array-dimensions matrix)))
          (result (make-array (array-dimensions matrix))))
    
    (loop for i upfrom 0 to (- n 1)
        do
        (loop for j upfrom 0 to (- m 1)
            do
            (setf (aref result i j) (aref matrix i (- m j 1)))
        )       
    )
    result)
)

(print (swap-columns #2A((1 2 3)(4 5 6))))

