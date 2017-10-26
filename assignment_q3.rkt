#lang racket

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
   (printf "~a~n" (val bst));
   (cond [(not (empty?(right_child bst))) (sortTree (right_child bst))])))

;B
(define (present el bst)
(cond
  [(empty? bst) #f]
  [(equal? el (val bst)) #t]
  [(< el (val bst)) (present el (left_child bst))];Check left if el is less than current value
  [else (present el (right_child bst))];Else check right
  )
  )

;C
(define (addItem el bst); Check val - go left or right - recurse till null and insert
  (cond
    [(null? bst) (insert el bst)]
    [(equal? el (val bst)) bst]
    [(< el (val bst)) (addItem el (left_child bst))]
    [(> el (val bst)) (addItem el (right_child bst))]
    )
  printf bst
        )

(define (insert el bst)
  (append (((cons '()(cons el (cons '() '() ))) bst))
  ) 
  )
  