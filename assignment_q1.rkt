#lang racket
(cons 1 2)

(cons 1(cons 2 3))

(cons "Hello"(cons 7 (cons 1(cons 2 3))))

(list "Hello" 7 (list 1 2 3))

(append '(Hello) '(7) '(( 1 2 3)))