;;; Exercise 1.18 - Fast Multiplication (Iterative Process)
;;; Demonstrates logarithmic multiplication using accumulator pattern

(define (even? n)
  "Test if n is even"
  (= (remainder n 2) 0))

(define (double x)
  "Double the value of x"
  (* x 2))

(define (halve x)
  "Halve the value of x"
  (/ x 2))

;;; Fast multiplication using iterative process
;;; Invariant: result = c + a*b (maintained throughout)
(define (fast-multiply a b)
  "Multiply a and b in Θ(log b) time using iterative process"
  (fast-mult-iter a b 0))

(define (fast-mult-iter a b c)
  "Iterative multiplication maintaining invariant c + a*b"
  (cond ((= b 0) c)
        ((even? b) (fast-mult-iter (double a) (halve b) c))
        (else (fast-mult-iter a (- b 1) (+ c a)))))

;;; Comparison implementations
(define (multiply-recursive a b)
  "Recursive multiplication from Exercise 1.17"
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (multiply-recursive (double a) (halve b)))
        (else (+ a (multiply-recursive a (- b 1))))))

(define (multiply-naive a b)
  "Naive iterative multiplication"
  (define (iter count result)
    (if (= count 0)
        result
        (iter (- count 1) (+ result a))))
  (iter b 0))

;;; Educational demonstration
(display "=== Exercise 1.18: Fast Multiplication (Iterative) ===\n")
(newline)

(display "Comparing three multiplication approaches:\n")
(newline)

(define (test-all-multiply a b)
  "Test all three multiplication methods"
  (display a)
  (display " × ")
  (display b)
  (display " = ")
  (display (fast-multiply a b))
  (display " | Recursive: ")
  (display (multiply-recursive a b))
  (display " | Naive: ")
  (display (multiply-naive a b))
  (newline))

(test-all-multiply 17 19)
(test-all-multiply 25 16)
(test-all-multiply 13 32)
(test-all-multiply 7 8)

(newline)
(display "Detailed trace of fast-multiply(17, 19):\n")
(display "Invariant: c + a*b = result\n")
(display "Step 1: c=0,  a=17, b=19  -> 0 + 17*19\n")
(display "Step 2: c=17, a=17, b=18  -> 17 + 17*18\n")
(display "Step 3: c=17, a=34, b=9   -> 17 + 34*9\n")
(display "Step 4: c=51, a=34, b=8   -> 51 + 34*8\n")
(display "Step 5: c=51, a=68, b=4   -> 51 + 68*4\n")
(display "Step 6: c=51, a=136, b=2  -> 51 + 136*2\n")
(display "Step 7: c=51, a=272, b=1  -> 51 + 272*1\n")
(display "Step 8: c=323, a=272, b=0 -> 323 + 272*0 = 323\n")

(newline)
(display "Algorithm comparison:\n")
(display "1. Iterative (this): Θ(log b) time, Θ(1) space\n")
(display "2. Recursive (1.17): Θ(log b) time, Θ(log b) space\n")
(display "3. Naive: Θ(b) time, Θ(1) space\n")

(newline)
(display "Key insight: Invariant c + a*b allows iterative process\n")