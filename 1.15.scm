#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
(if (not (> (abs angle) 0.1))
angle
(p (sine (/ angle 3.0)))))


;; If angle is less than or equal to one tenth, R(n)=1.
(sine 0.2)
(p (sine (/ 0.2 3.0)))
(- (* 3 (/ 0.2 3.0)) (* 4 (cube (/ 0.2 3.0))))
(- (* 3 (/ 0.2 3.0)) (* 4 (* (/ 0.2 3.0) (/ 0.2 3.0) (/ 0.2 3.0))))

(sine 0.1)


;; How is this combination evaluated? The book says that it may seem disturbing that
;; procedures can be defined in terms of themselves.

;; What's the difference between a formal parameter and an operand?