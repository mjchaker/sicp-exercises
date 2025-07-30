;;; Exercise 1.8 - Cube Root Using Newton's Method
;;; Demonstrates Newton's method for cube roots and numerical approximation

(define (square x) 
  "Compute the square of x"
  (* x x))

(define (cube x) 
  "Compute the cube of x"
  (* x x x))

;;; Newton's method for cube roots: x_{n+1} = (x^2/y^2 + 2x) / 3
;;; where we're finding y such that y^3 = x

(define (cube-root x)
  "Find cube root using Newton's method with improved convergence test"
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  "Iterative process for cube root calculation"
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  "Newton's method improvement step: (x/guess² + 2*guess) / 3"
  (average3 (/ x (square guess)) (* 2 guess)))

(define (average3 x y)
  "Compute average of x and y, then divide by 3 for Newton's method"
  (/ (+ x y) 3))

;;; Convergence tests - comparing different approaches

(define (good-enough-absolute? guess x)
  "Original absolute difference test - problematic for extreme values"
  (< (abs (- (improve guess x) guess)) 0.001))

(define (good-enough? guess x)
  "Improved relative difference test"
  (< (/ (abs (- (improve guess x) guess)) guess) 0.000001))

;;; Alternative implementation for comparison
(define (cube-root-simple x)
  "Simple cube root using absolute tolerance"
  (define (iter guess)
    (if (good-enough-absolute? guess x)
        guess
        (iter (improve guess x))))
  (iter 1.0))

;;; Educational demonstration
(display "=== Exercise 1.8: Cube Root Using Newton's Method ===")
(newline)
(newline)

(display "Newton's method for cube roots:")
(newline)
(display "If y³ = x, then y = (x/y² + 2y) / 3")
(newline)
(newline)

(define (test-cube-root n)
  "Test cube root calculation and show verification"
  (let ((result (cube-root n))
        (simple (cube-root-simple n)))
    (display "∛")
    (display n)
    (display " = ")
    (display result)
    (display " (simple: ")
    (display simple)
    (display ")")
    (newline)
    (display "  Verification: ")
    (display result)
    (display "³ = ")
    (display (cube result))
    (display " (error: ")
    (display (abs (- (cube result) n)))
    (display ")")
    (newline)
    (newline)))

(display "Testing cube root calculations:")
(newline)
(test-cube-root 8)      ; Should be 2
(test-cube-root 27)     ; Should be 3
(test-cube-root 64)     ; Should be 4
(test-cube-root 125)    ; Should be 5
(test-cube-root 2)      ; Should be ∛2 ≈ 1.26
(test-cube-root 0.001)  ; Small number test
(test-cube-root 1000000) ; Large number test

(display "Key concepts demonstrated:")
(newline)
(display "1. Newton's method for non-square roots")
(newline)
(display "2. Numerical approximation and convergence")
(newline)
(display "3. Relative vs absolute error tolerance")
(newline)
(display "4. Iterative refinement process")
(newline)
(display "5. Mathematical verification of results")
(newline)



