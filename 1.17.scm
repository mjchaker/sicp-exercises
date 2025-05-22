#lang sicp

(define (fast-multiply a b)
  (define (double x) (* 2 x))
  (define (halve x) (/ x 2))
  (cond ((= b 1) a)
        ((even? b) (fast-multiply (double a) (halve b)))
        (else (+ (fast-multiply a (- b 1)) (fast-multiply a 1)))))