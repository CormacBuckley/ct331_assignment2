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

(define (ins_beg el lst)
  (
   display "Hello, I'm ins_beg!\n")

  (cons el lst)
  )

(define (ins_end el lst)
  (
   display "Hello, I'm ins_end!\n")

  (cons lst el)
  )
