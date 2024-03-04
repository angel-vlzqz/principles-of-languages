;; Write a function to create a binary search tree (BST) by reading a list of integers from a list and output the BST.
(defun createBST (lst)
    (if (null lst)
        nil
        (let ((root (car lst)))
            (cons root
                (cons (createBST (remove-if-not #'(lambda (x) (< x root)) (cdr lst)))
                      (createBST (remove-if-not #'(lambda (x) (> x root)) (cdr lst))))))))

;; Display the tree elements using preorder traversal.
(defun preorder (tree)
    (if (null tree)
        nil
        (cons (car tree)
              (append (preorder (cadr tree))
                      (preorder (caddr tree))))))

;; Display using in-order traversal.
(defun inorder (tree)
    (if (null tree)
        nil
        (append (inorder (cadr tree))
                (cons (car tree)
                      (inorder (caddr tree))))))

;; Display using post-order traversal.
(defun postorder (tree)
    (if (null tree)
        nil
        (append (postorder (cadr tree))
                (postorder (caddr tree))
                (list (car tree)))))

;; Example usage:
(setq mytree (createBST '(9 8 7 5 3 2 1)))
(print (preorder mytree))
(print (inorder mytree))
(print (postorder mytree))


