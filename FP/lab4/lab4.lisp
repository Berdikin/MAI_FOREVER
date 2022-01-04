(defun whitespace-char-p (char)
  (member char '(#\Space #\Tab #\Newline)))

(defun word-list (string)
  ;; Разбить строки на слова, разделённые знаками whitespace
  ;; A la (split-seq-if #'whitespace-char-p string)
  (loop with len = (length string)
        for left = 0 then (1+ right)
        for right = (or (position-if #'whitespace-char-p string
                                     :start left)
                        len)
        unless (>= (1+ left) right)	; исключить пустые слова
          collect (subseq string (1+ left) right)
        while (< right len)))

(defun concat-list(words)
    (let ((res ""))
        (dolist (word words)
            (setf res (concatenate 'string res word " "))
        )
        (string-trim " " res)
    )
)

(defun trim(sentence)
    (concat-list (word-list sentence))
)

(print (trim "abc ab a bca bc b"))
