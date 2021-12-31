(defun delete_end(list)                      
  (cond ((null (cdr list)) 
     nil)                        
    (t 
     (cons (car list) 
           (delete_end (cdr list))))))
