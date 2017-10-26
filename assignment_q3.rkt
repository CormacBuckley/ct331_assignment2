#lang racket

(provide tree)
(provide to_Sort)
(provide left_child)
(provide right_child)
(provide val)
(provide sortTree)
(provide present)
(provide addItem)
(provide add_list)
(provide higher_order_add_list)
(provide tree_sort)
(provide higher_order_tree_sort)
(provide higher_order_addItem)

(define tree '(((() 3 ()) 8 (() 11 ())) 19 ((() 25 ()) 29 (() 52 ()))))
(define to_Sort '(2 11 105 66 4 19 47 33))

(define (left_child bst)
  (car bst))

(define (right_child bst)
  (caddr bst))

(define (val bst)
  (cadr bst))
;A
(define (sortTree bst);sort left then sort right
 (begin(cond [(not (empty?(left_child bst))) (sortTree (left_child bst))])
   (printf "~a " (val bst));
   (cond [(not (empty?(right_child bst))) (sortTree (right_child bst))])))

;B
(define (present el bst)
(cond
  [(empty? bst) #f]
  [(equal? el (val bst)) #t]
  [(< el (val bst)) (present el (left_child bst))]
  [else (present el (right_child bst))]
  )
  )

;C
(define (addItem el bst); Check val - go left or right - recurse till null and insert
  (higher_order_addItem el bst <)
  )


;D
(define (add_list lst bst)
  (if (empty? lst) bst
      (add_list (cdr lst) (addItem (car lst) bst))))

(define (higher_order_add_list lst bst left)
  (if (empty? lst) bst
      (higher_order_add_list (cdr lst) (higher_order_addItem (car lst) bst left) left)))



;E
(define (tree_sort lst)
  (sortTree (add_list lst '())))

(define (higher_order_tree_sort lst orderFunc)
  (sortTree (higher_order_add_list lst '() orderFunc)))



;F
(define (higher_order_addItem item bst left)
  (cond [(empty? bst) (list '() item '())]
        [(equal? item (val bst)) bst]
        [(left item (val bst))
         (list (higher_order_addItem item (left_child bst) left) (val bst) (right_child bst))]
        [else (list (left_child bst) (val bst) (higher_order_addItem item (right_child bst) left))]))



(define (ascending_last_digit a b)
  (< (remainder a 10) (remainder b 10)))

(display "display_sorted:\n")
(sortTree tree)

(display "present_in_tree:\n")
(present 19 tree)
(present 208 tree)

(display "addItem\n")
(addItem 12 tree)

(display "add_list:\n")
(add_list '(4 19 88 99 65) tree)

(display "tree_sort:\n")
(tree_sort to_Sort)

(display "higher_order_tree_sort:\n")
(display "ASCENDING:\n")
(higher_order_tree_sort to_Sort <)
(display "\nDESCENDING:\n")
(higher_order_tree_sort to_Sort >)
(display "\nASCENDING BASED ON LAST DIGIT:\n")
(higher_order_tree_sort to_Sort ascending_last_digit)