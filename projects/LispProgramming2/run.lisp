(defun length-tail (lst &optional (acc 0))
  (if (endp lst)
      acc
      (length-tail (cdr lst) (+ acc 1))))

(defun min-max (lst) 
    (let ((min (car lst)) (max (car lst))) 
         (dolist (x lst) 
             (if (< x min) 
                 (setf min x) 
             (if (> x max) 
                 (setf max x)))) 
         (values min max)))

(defun collect-integers (lst)
  lst)

(defun process-list (lst)
  (let ((test-list lst))
    (format t "List entered: ~a~%" test-list)
    (multiple-value-bind (max-val min-val)
        (min-max test-list)
      (format t "Maximum value: ~a~%" min-val)
      (format t "Minimum value: ~a~%" max-val))))

(defun quicksort (lst)
  (if (endp lst)
      nil
      (let* ((pivot (car lst))
             (less (remove-if-not #'(lambda (x) (< x pivot)) (cdr lst)))
             (greater (remove-if-not #'(lambda (x) (>= x pivot)) (cdr lst))))
        (append (quicksort less) (list pivot) (quicksort greater)))))

;; Test cases
(format t "Test Case 1: Length of list~%")
(let ((test-list '(1 2 4 5)))
  (format t "Length of ~a is ~a~%" test-list (length-tail test-list)))

(format t "~%Test Case 2: Find Max and Min~%")
(let ((test-list '(4 2 7 1 9)))
  (multiple-value-bind (max-val min-val)
      (min-max test-list)
    (format t "List: ~a~%" test-list)
    (format t "Maximum value: ~a~%" max-val)
    (format t "Minimum value: ~a~%" min-val)))

(format t "~%Test Case 3: Collect Integers~%")
(let ((test-list '(3 6 9 12)))
  (format t "Collected List: ~a~%" (collect-integers test-list)))

(format t "~%Test Case 4: Process List~%")
(let ((test-list '(8 2 5 1 7)))
  (process-list test-list))

(format t "~%Test Case 5: Quicksort~%")
(let ((test-list '(5 3 8 1 9 2)))
  (format t "Original List: ~a~%" test-list)
  (format t "Sorted List: ~a~%" (quicksort test-list)))

