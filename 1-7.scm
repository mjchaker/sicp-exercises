;;; Exercise 1.7 - Improved Square Root Algorithm
;;; Demonstrates Newton's method and the problem with fixed tolerance

(define (square x) 
  "Compute the square of x"
  (* x x))

(define (average x y)
  "Compute the arithmetic mean of x and y"
  (/ (+ x y) 2))

;;; Original version with fixed tolerance (problematic for very large/small numbers)
(define (sqrt-original x)
  "Original square root with fixed tolerance - has issues with extreme values"
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

;;; Improved version with relative tolerance
(define (sqrt-improved x)
  "Improved square root using relative tolerance instead of absolute"
  (define (good-enough? guess)
    (< (/ (abs (- (improve guess) guess)) guess) 0.00000000001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))  
  (sqrt-iter 1.0))

;;; Educational demonstration
(display "=== Exercise 1.7: Square Root Algorithm Comparison ===")
(newline)
(newline)

(display "Comparing original vs improved square root algorithms:")
(newline)
(newline)

(define (test-sqrt n)
  "Test both algorithms and show the difference"
  (let ((original (sqrt-original n))
        (improved (sqrt-improved n))
        (builtin (sqrt n)))
    (display "sqrt(")
    (display n)
    (display "):")
    (newline)
    (display "  Original:  ")
    (display original)
    (display " (error: ")
    (display (abs (- (square original) n)))
    (display ")")
    (newline)
    (display "  Improved:  ")
    (display improved)
    (display " (error: ")
    (display (abs (- (square improved) n)))
    (display ")")
    (newline)
    (display "  Built-in:  ")
    (display builtin)
    (newline)
    (newline)))

(display "Testing with normal numbers:")
(newline)
(test-sqrt 9)
(test-sqrt 2)
(test-sqrt 100)

(display "Testing with very small numbers (where original fails):")
(newline)
(test-sqrt 0.0001)
(test-sqrt 0.000000001)

(display "Testing with very large numbers:")
(newline)
(test-sqrt 1000000)
(test-sqrt 100000000)

(display "Key insights:")
(newline)
(display "1. Fixed tolerance fails for very small numbers")
(newline)
(display "2. Relative tolerance adapts to the scale of the number")
(newline)
(display "3. Newton's method: x_{n+1} = (x_n + a/x_n) / 2")
(newline)
(display "4. Convergence depends on good stopping criteria")
(newline)
