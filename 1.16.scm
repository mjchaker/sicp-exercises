#lang sicp

(define (expt b n a)
  (cond ((= n 0) a)
	((even? n) (expt (square b) (/ n 2) a))
	(else (expt b (- n 1) (* a b)))))

(define (square x) (* x x))
(define (even? n)
(= (remainder n 2) 0))

