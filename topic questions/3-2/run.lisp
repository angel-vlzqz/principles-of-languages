(defun root (a b c)
  "Calculate roots of the quadratic equation ax^2 + bx + c = 0."
  (let* ((discriminant (- (* b b) (* 4 a c)))
         (sqrt-discriminant (sqrt discriminant))
         (denominator (* 2 a)))
    (if (< discriminant 0)
      nil  ; no real roots
      (list (/ (+ (- b) sqrt-discriminant) denominator)
            (/ (- (- b) sqrt-discriminant) denominator)))))

(defun remove-repetition (lst)
  "Remove repetition from a list."
  (cond
    ((null lst) nil)
    ((member (car lst) (cdr lst)) (remove-repetition (cdr lst)))
    (t (cons (car lst) (remove-repetition (cdr lst))))))

;; test case 1.1
(setq roots (root 1 -3 2))
(print roots)

;; test case 1.2
(setq roots (root 3 -8 -11))
(print roots)

;; test case 2.1
(setq original-list '(1 2 2 3 3 3 4 4 4 5 5 5 5))
(setq unique-list (remove-repetition original-list))
(print unique-list)

;; test case 2.2
(setq original-list '(1 2 1 1 4 7 8 9 6 8 7 6 8 9 2 9 0 4 9 2))
(setq unique-list (remove-repetition original-list))
(print unique-list)

