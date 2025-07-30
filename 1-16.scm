;;; Exercise 1.16 - Fast Exponentiation (Iterative Process)
;;; Demonstrates logarithmic-time algorithm using invariant a*b^n

(define (square x) 
  "Compute the square of x"
  (* x x))

(define (even? n)
  "Test if n is even"
  (= (remainder n 2) 0))

;;; Fast exponentiation using iterative process
;;; Invariant: result = a * b^n (maintained throughout)
(define (fast-expt b n)
  "Compute b^n in Θ(log n) time using iterative process"
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  "Iterative exponentiation maintaining invariant a*b^n"
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

;;; Comparison with naive recursive approach
(define (expt-recursive b n)
  "Naive recursive exponentiation - Θ(n) time"
  (if (= n 0)
      1
      (* b (expt-recursive b (- n 1)))))

;;; Educational demonstration
(display "=== Exercise 1.16: Fast Exponentiation Analysis ===\n")
(newline)

(display "Comparing iterative fast exponentiation vs naive recursion:\n")
(newline)

(define (test-expt base power)
  "Test both algorithms and show timing difference"
  (display base)
  (display "^")
  (display power)
  (display " = ")
  (display (fast-expt base power))
  (display " (naive: ")
  (display (expt-recursive base power))
  (display ")\n"))

(test-expt 2 10)    ; 2^10 = 1024
(test-expt 3 5)     ; 3^5 = 243  
(test-expt 5 4)     ; 5^4 = 625
(test-expt 2 16)    ; 2^16 = 65536

(newline)
(display "Trace of fast-expt(2, 10):\n")
(display "Invariant: a * b^n = result\n")
(display "(2^10, a=1): 1 * 2^10\n")
(display "(4^5,  a=1): 1 * 4^5\n")
(display "(4^4,  a=4): 4 * 4^4\n")
(display "(16^2, a=4): 4 * 16^2\n")
(display "(256^1,a=4): 4 * 256^1\n")
(display "(256^0,a=1024): 1024 * 256^0 = 1024\n")

(newline)
(display "Key insights:\n")
(display "1. Invariant a*b^n maintained throughout\n")
(display "2. Even exponent: square base, halve exponent\n")
(display "3. Odd exponent: multiply accumulator, decrement\n") 
(display "4. Time complexity: Θ(log n) vs Θ(n)\n")
(display "5. Space complexity: Θ(1) - true iteration\n")

