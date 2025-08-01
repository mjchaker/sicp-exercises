;;; Exercise 1.11 - Recursive vs Iterative Process
;;; MIT/GNU Scheme compatible version

(define (f n) (fi n 0 1 2)) 

(define (fi i a b c) 
   (cond ((< i 0) i) 
         ((= i 0) a) 
         (else (fi (- i 1) b c (+ c (* 2 b) (* 3 a))))))

;;; Test the function
(display "f(5) = ")
(display (f 5))
(newline)

;;; Additional tests
(display "f(0) = ")
(display (f 0))
(newline)

(display "f(1) = ")
(display (f 1))
(newline)

(display "f(2) = ")
(display (f 2))
(newline)

;;i is not less than zero.
;;i is not equal to zero.

;;(fi (- 5 1) 1 2 (+ 2 (* 2 1) (* 3 0)))
;;(fi 4 1 2 4)

;;i is not less than zero.
;;i is not equal to zero.

;;(fi (- 4 1) 2 4 (+ 4 (* 2 2) (*3 1)))
;;(fi 3 2 4 11)

;;i is not less than zero.
;;i is not equal to zero.

;;(fi (- 3 1) 4 11 (+ 11 (* 2 4) (* 3 2)))
;;(fi 2 4 11 25)

;;i is less than 3, therefore it should be c. However, since the
;;procedure terminates only when i = 0, it will have computed f(n+1) and f(n+2)