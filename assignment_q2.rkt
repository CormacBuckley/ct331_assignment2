#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

;A
(define (ins_beg el lst)
  (
   display "ins_beg Running\n")

  (cons el lst)
  )

;B
(define (ins_end el lst)
  (
   display "ins_end Running\n")

  (cons lst (list el))
  )

;C
(define (count_top_level list)
  (if (null? list)
      0
      (+ 1 (count_top_level (cdr list)))
  )
)

;D
(define (count_instances el lst)
   (cond ((null? lst)0)
   ((equal? el (car lst))(+ 1(count_instances el (cdr lst))))
    ((count_instances el (cdr lst)))
   )
  )


;E
(define (count_instances_tr el lst) ;This is the main funciton
  (tinst el 0 lst) ;Main funciton calls this helper funciton to do the 'grunt work' It gets the element to look for, runing total and list
 )

(define (tinst el total lst);This is the helper function
   (cond ((null? lst)0);Check for null
   ((equal? el (car lst))(+ 1 total(tinst el total (cdr lst))));If match found increment the total and recurse in the helper.
    ((tinst el total (cdr lst)));;Recurse the helper
    ;Since the function is being called on known values (el, total and list) there is very little overhead to the recursion.
    )
  )


;F
(define (count_instances_deep el lst); Main Function
  (cond [(empty? lst) 0]; Check empty
        [(list? (car lst)) (+ (count_instances_deep el (car lst)) (count_instances_deep el (cdr lst)))]
        ; if car is a list, recurse inside that car and add the result to the recurse of the rest of the original list(cdr)
        [(equal? el (car lst)) (+ 1 (count_instances_deep el (cdr lst)))]; same code as previous question to increment total
        [else (count_instances_deep el (cdr lst))])); recurse rest of list