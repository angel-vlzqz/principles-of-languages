;; Recursive Fibonacci function
(defun fib (n)
  (if (<= n 1)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

;; Recursive function RFL to remove the first and last element from a list
(defun rfl (lst)
  (if (> (length lst) 2)
      (butlast (cdr lst))
      lst))

;; Recursive function ispal to check if the elements of a list are palindrome
(defun ispal (lst)
  (if (<= (length lst) 1)
      t
      (and (equal (first lst) (last lst))
           (ispal (butlast (cdr lst))))))

;; Test the Fibonacci function
(format t "Fibonacci of 20 is ~d~%" (fib 20))

;; Test the RFL function
(format t "Before RFL: ~a~%" `(1 2 3 4 5))
(format t "After RFL: ~a~%" (rfl `(1 2 3 4 5)))

;; Test the ispal function
(if (ispal '(1 3 2 1))
    (format t "The list is a palindrome.~%")
    (format t "The list is not a palindrome.~%"))

