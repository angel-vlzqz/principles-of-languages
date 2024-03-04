(defun slast (lst)
  (cond
    ((null lst) -1)               ; If the list is empty, return -1
    ((null (cdr lst)) -1)         ; If the list has only one element, return -1
    ((null (cddr lst)) (car lst)) ; If the list has two elements, return the first element
    (t (slast (cdr lst)))))       ; Recursively call slast on the rest of the list

; Test cases
(print (slast '(1 2 3 4)))   ; Output should be 3
(print (slast '()))          ; Output should be -1
(print (slast '(2)))         ; Output should be -1
(print (slast '(1 2)))       ; Output should be 1

