;;; Exercise 1.20 - GCD and Order of Evaluation
;;; Demonstrates difference between applicative-order and normal-order evaluation

(define (gcd a b)
  "Compute greatest common divisor using Euclid's algorithm"
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;;; Instrumented version to count remainder operations
(define remainder-count 0)

(define (reset-remainder-counter!)
  "Reset the remainder operation counter"
  (set! remainder-count 0))

(define (instrumented-remainder a b)
  "Remainder operation that counts calls"
  (set! remainder-count (+ remainder-count 1))
  (remainder a b))

(define (gcd-instrumented a b)
  "GCD with instrumented remainder to count operations"
  (if (= b 0)
      a
      (gcd-instrumented b (instrumented-remainder a b))))

;;; Educational demonstration
(display "=== Exercise 1.20: GCD and Order of Evaluation ===\n")
(newline)

(display "Euclid's Algorithm: gcd(a,b) = gcd(b, a mod b)\n")
(newline)

;;; Demonstrate normal gcd
(display "Computing gcd(206, 40):\n")
(display "Result: ")
(display (gcd 206 40))
(newline)
(newline)

;;; Count operations with instrumented version
(reset-remainder-counter!)
(let ((result (gcd-instrumented 206 40)))
  (display "With instrumented remainder operations: ")
  (display result)
  (display " (")
  (display remainder-count)
  (display " remainder operations)\n"))

(newline)
(display "APPLICATIVE-ORDER EVALUATION:\n")
(display "(Arguments evaluated before procedure application)\n")
(newline)
(display "gcd(206, 40)\n")
(display "gcd(40, remainder(206, 40)) = gcd(40, 6)\n")
(display "gcd(6, remainder(40, 6)) = gcd(6, 4)\n")
(display "gcd(4, remainder(6, 4)) = gcd(4, 2)\n")
(display "gcd(2, remainder(4, 2)) = gcd(2, 0)\n")
(display "gcd(2, 0) = 2\n")
(display "Remainder operations: 4\n")

(newline)
(display "NORMAL-ORDER EVALUATION:\n")
(display "(Expressions substituted until primitive operations)\n")
(newline)
(display "gcd(206, 40)\n")
(display "if (= 40 0) -> false\n")
(display "gcd(40, remainder(206, 40))\n")
(newline)
(display "if (= remainder(206, 40) 0) -> evaluate remainder(206, 40) = 6\n")
(display "if (= 6 0) -> false, so: gcd(remainder(206, 40), remainder(40, remainder(206, 40)))\n")
(display "Remainder operations so far: 1\n")
(newline)
(display "Next: if (= remainder(40, remainder(206, 40)) 0)\n")
(display "Must evaluate: remainder(40, 6) = 4, so if (= 4 0) -> false\n")
(display "Remainder operations so far: 1 + 2 = 3\n")
(newline)
(display "This pattern continues with exponentially growing\n")
(display "remainder expressions until final evaluation.\n")
(display "Total remainder operations in normal-order: 18\n")

(newline)
(display "Key insights:\n")
(display "1. Applicative-order: 4 remainder operations\n")
(display "2. Normal-order: 18 remainder operations\n")
(display "3. Normal-order can lead to repeated computation\n")
(display "4. Applicative-order is more efficient for this algorithm\n")

