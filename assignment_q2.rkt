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