;;; Exercise 1.17 - Fast Multiplication (Recursive Process)
;;; Demonstrates logarithmic multiplication using doubling/halving

(define (double x) 
  "Double the value of x"
  (* 2 x))

(define (halve x) 
  "Halve the value of x"
  (/ x 2))

(define (even? n)
  "Test if n is even"
  (= (remainder n 2) 0))

;;; Fast multiplication using recursive process
(define (fast-multiply a b)
  "Multiply a and b in Θ(log b) time using recursive process"
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (fast-multiply (double a) (halve b)))
        (else (+ a (fast-multiply a (- b 1))))))

;;; Comparison with iterative addition
(define (multiply-slow a b)
  "Naive multiplication by repeated addition - Θ(b) time"
  (if (= b 0)
      0
      (+ a (multiply-slow a (- b 1)))))

;;; Educational demonstration
(display "=== Exercise 1.17: Fast Multiplication (Recursive) ===\n")
(newline)

(display "Comparing fast multiplication vs repeated addition:\n")
(newline)

(define (test-multiply a b)
  "Test both algorithms"
  (display a)
  (display " × ")
  (display b)
  (display " = ")
  (display (fast-multiply a b))
  (display " (slow: ")
  (display (multiply-slow a b))
  (display ")\n"))

(test-multiply 3 7)     ; 3 × 7 = 21
(test-multiply 17 19)   ; 17 × 19 = 323
(test-multiply 25 16)   ; 25 × 16 = 400
(test-multiply 13 32)   ; 13 × 32 = 416

(newline)
(display "Trace of fast-multiply(17, 19):\n")
(display "17 × 19\n")
(display "= 17 + 17 × 18\n")
(display "= 17 + 34 × 9\n")
(display "= 17 + 34 + 34 × 8\n")
(display "= 17 + 34 + 68 × 4\n")
(display "= 17 + 34 + 136 × 2\n")
(display "= 17 + 34 + 272 × 1\n")
(display "= 17 + 34 + 272 = 323\n")

(newline)
(display "Key concepts:\n")
(display "1. Recursive process (deferred operations)\n")
(display "2. Even factor: double first, halve second\n")
(display "3. Odd factor: add first, decrement second\n")
(display "4. Time complexity: Θ(log b)\n")
(display "5. Space complexity: Θ(log b) - recursive calls\n")