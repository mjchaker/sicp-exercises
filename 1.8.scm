#lang sicp

(define (square x) (* x x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (average (/ x (square guess)) (* 2 guess)))

(define (average x y)
  (/ (+ x y) 3))

;; Original good-enough?

;; (define (good-enough? guess x)
;;   (< (abs (- (improve guess x) guess))
;;      (* guess .001)))

;; Better good-enough?

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.000001))



