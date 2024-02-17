(defun add-and-subtract (a b)
  (list (+ a b) (- a b)))

;; Calculate 5 * 5 - 4 * 6
(setq result (add-and-subtract (* 5 5) (* 4 6)))

;; Print the result
(format t "Result: ~a~%" result)

