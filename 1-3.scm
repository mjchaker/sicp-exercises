;;; Exercise 1.3 - Sum of Squares of Two Larger Numbers
;;; Educational demonstration of conditional expressions and logical operators

(define (square x) 
  "Compute the square of x"
  (* x x))

(define (sum-of-larger a b c)
  "Return the sum of squares of the two larger numbers among a, b, and c"
  (cond ((and (>= a c) (>= b c)) (+ (square a) (square b))) 
        ((and (>= a b) (>= c b)) (+ (square a) (square c)))
        ((and (>= c a) (>= b a)) (+ (square c) (square b)))))

;;; Alternative implementation using helper functions for clarity
(define (max-of-two x y)
  "Return the maximum of two numbers"
  (if (>= x y) x y))

(define (min-of-two x y)
  "Return the minimum of two numbers"
  (if (<= x y) x y))

(define (sum-of-larger-alt a b c)
  "Alternative implementation: find the minimum and exclude it"
  (let ((minimum (min-of-two (min-of-two a b) c)))
    (cond ((= minimum a) (+ (square b) (square c)))
          ((= minimum b) (+ (square a) (square c)))
          (else (+ (square a) (square b))))))

;;; Demonstration and testing
(display "=== Exercise 1.3: Sum of Squares of Two Larger Numbers ===")
(newline)
(newline)

(display "Testing sum-of-larger with different inputs:")
(newline)

(define (test-case a b c)
  (display "sum-of-larger(")
  (display a)
  (display ", ")
  (display b)
  (display ", ")
  (display c)
  (display ") = ")
  (display (sum-of-larger a b c))
  (display " | Alternative: ")
  (display (sum-of-larger-alt a b c))
  (newline))

(test-case 3 4 5)   ; Expected: 4² + 5² = 16 + 25 = 41
(test-case 1 2 3)   ; Expected: 2² + 3² = 4 + 9 = 13
(test-case 5 1 3)   ; Expected: 5² + 3² = 25 + 9 = 34
(test-case 2 2 1)   ; Expected: 2² + 2² = 4 + 4 = 8
(test-case 7 7 7)   ; Expected: 7² + 7² = 49 + 49 = 98

(newline)
(display "Key concepts demonstrated:")
(newline)
(display "1. Conditional expressions (cond)")
(newline)
(display "2. Logical operators (and, >=)")
(newline)
(display "3. Function composition")
(newline)
(display "4. Alternative problem-solving approaches")
(newline)
