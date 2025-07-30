;;; Exercise 1.21 - Finding Smallest Divisors
;;; Demonstrates prime testing and divisor finding algorithms

(define (square x) 
  "Compute the square of x"
  (* x x))

(define (divides? a b)
  "Test if a divides b evenly"
  (= (remainder b a) 0))

(define (smallest-divisor n)
  "Find the smallest divisor of n greater than 1"
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  "Find smallest divisor starting from test-divisor"
  (cond ((> (square test-divisor) n) n)  ; No divisor found, n is prime
        ((divides? test-divisor n) test-divisor)  ; Found divisor
        (else (find-divisor n (+ test-divisor 1)))))  ; Try next

(define (prime? n)
  "Test if n is prime (smallest divisor equals n)"
  (= n (smallest-divisor n)))

;;; Optimized version that skips even numbers after 2
(define (find-divisor-optimized n test-divisor)
  "Optimized divisor search - skips even numbers after 2"
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        ((= test-divisor 2) (find-divisor-optimized n 3))  ; Jump to odd numbers
        (else (find-divisor-optimized n (+ test-divisor 2))))) ; Skip evens

(define (smallest-divisor-optimized n)
  "Optimized smallest divisor finder"
  (find-divisor-optimized n 2))

;;; Educational demonstration
(display "=== Exercise 1.21: Finding Smallest Divisors ===\n")
(newline)

(display "Algorithm: Test divisors from 2 up to √n\n")
(display "If no divisor found, the number is prime\n")
(newline)

(define (analyze-number n)
  "Analyze a number's divisibility and primality"
  (let ((divisor (smallest-divisor n))
        (optimized-divisor (smallest-divisor-optimized n)))
    (display "n = ")
    (display n)
    (display ": smallest divisor = ")
    (display divisor)
    (if (= divisor n)
        (display " (PRIME)")
        (begin
          (display " -> ")
          (display n)
          (display " = ")
          (display divisor)
          (display " × ")
          (display (/ n divisor))))
    (newline)))

(display "Testing the required numbers:\n")
(analyze-number 199)   ; Should be prime
(analyze-number 1999)  ; Should be prime  
(analyze-number 19999) ; Should find divisor

(newline)
(display "Additional test cases:\n")
(analyze-number 4)     ; 2 × 2
(analyze-number 15)    ; 3 × 5
(analyze-number 25)    ; 5 × 5
(analyze-number 100)   ; 2 × 50
(analyze-number 101)   ; Prime

(newline)
(display "Prime testing examples:\n")
(define test-numbers '(2 3 4 5 6 7 8 9 10 11 12 13 17 19 23))
(define (test-primes numbers)
  (if (not (null? numbers))
      (let ((n (car numbers)))
        (display n)
        (if (prime? n)
            (display " is prime")
            (display " is composite"))
        (newline)
        (test-primes (cdr numbers)))))

(test-primes test-numbers)

(newline)
(display "Key insights:\n")
(display "1. Only need to test up to √n\n")
(display "2. If no divisor ≤ √n, then n is prime\n")
(display "3. Can optimize by skipping even numbers after 2\n")
(display "4. Time complexity: O(√n)\n")