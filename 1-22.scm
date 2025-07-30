;;; Exercise 1.22 - Timed Prime Testing
;;; Demonstrates performance measurement and algorithmic analysis

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
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  "Test if n is prime"
  (= n (smallest-divisor n)))

;;; Timing utilities
(define (timed-prime-test n)
  "Test if n is prime and report timing"
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  "Start prime test with timing"
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  "Report that a number is prime with elapsed time"
  (display " *** ")
  (display elapsed-time))

;;; Search for primes in ranges
(define (search-for-primes start end)
  "Search for primes in range [start, end]"
  (define (search n)
    (cond ((<= n end)
           (timed-prime-test n)
           (search (+ n 2)))))  ; Skip even numbers
  (if (even? start)
      (search (+ start 1))  ; Start with odd number
      (search start)))

(define (find-n-primes-from start count)
  "Find count primes starting from start"
  (define (find-primes n found)
    (cond ((= found count) 
           (display "\nFound ")
           (display count) 
           (display " primes\n"))
          ((prime? n)
           (timed-prime-test n)
           (find-primes (+ n 2) (+ found 1)))
          (else (find-primes (+ n 2) found))))
  (if (even? start)
      (find-primes (+ start 1) 0)
      (find-primes start 0)))

;;; Educational demonstration
(display "=== Exercise 1.22: Timed Prime Testing ===\n")
(newline)

(display "Finding first 3 primes near 1000:\n")
(find-n-primes-from 1000 3)

(newline)
(display "Finding first 3 primes near 10000:\n")
(find-n-primes-from 10000 3)

(newline)
(display "Finding first 3 primes near 100000:\n")
(find-n-primes-from 100000 3)

(newline)
(display "Finding first 3 primes near 1000000:\n")
(find-n-primes-from 1000000 3)

(newline)
(display "Performance Analysis:\n")
(display "Expected: √10 ≈ 3.16x slower for 10x larger numbers\n")
(display "Algorithm complexity: Θ(√n) for each prime test\n")
(display "Optimizations possible:\n")
(display "1. Skip even numbers (except 2)\n")
(display "2. Test only up to √n\n")
(display "3. Use wheel factorization\n")
(display "4. Probabilistic tests for very large numbers\n")

(newline)
(display "Sample individual tests:\n")
(timed-prime-test 1009)
(timed-prime-test 10007) 
(timed-prime-test 100003)
(timed-prime-test 1000003)
  