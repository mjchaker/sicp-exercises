;;; Pascal's Triangle Implementation
;;; Demonstrates recursive computation and combinatorial mathematics

(define (pascal row column)
  "Compute Pascal's triangle entry at (row, column) using recursion"
  (cond ((or (= column 1) (= row column)) 1)  ; Edges are 1
        ((< row column) 0)                    ; Invalid position
        (else (+ (pascal (- row 1) column)    ; Sum of two above
                 (pascal (- row 1) (- column 1))))))

;;; Alternative iterative implementation using binomial coefficient
(define (factorial n)
  "Compute n! iteratively"
  (define (fact-iter n result)
    (if (= n 0)
        result
        (fact-iter (- n 1) (* n result))))
  (fact-iter n 1))

(define (binomial n k)
  "Compute binomial coefficient C(n,k) = n!/(k!(n-k)!)"
  (if (or (= k 0) (= k n))
      1
      (/ (factorial n)
         (* (factorial k) (factorial (- n k))))))

(define (pascal-binomial row column)
  "Compute Pascal's triangle using binomial coefficient"
  (if (or (< row column) (< column 1))
      0
      (binomial (- row 1) (- column 1))))

;;; Display utilities
(define (print-pascal-row row size)
  "Print a single row of Pascal's triangle"
  (define (print-entries col)
    (if (<= col row)
        (begin
          (display (pascal row col))
          (display " ")
          (print-entries (+ col 1)))))
  (print-entries 1)
  (newline))

(define (print-pascal-triangle size)
  "Print Pascal's triangle up to given size"
  (define (print-rows row)
    (if (<= row size)
        (begin
          (print-pascal-row row size)
          (print-rows (+ row 1)))))
  (print-rows 1))

;;; Educational demonstration
(display "=== Pascal's Triangle Implementation ===\n")
(newline)

(display "Pascal's Triangle (first 8 rows):\n")
(print-pascal-triangle 8)

(newline)
(display "Individual entries (row, column):\n")
(display "pascal(5, 3) = ")
(display (pascal 5 3))
(display " (binomial: ")
(display (pascal-binomial 5 3))
(display ")\n")

(display "pascal(7, 4) = ")
(display (pascal 7 4))
(display " (binomial: ")
(display (pascal-binomial 7 4))
(display ")\n")

(display "pascal(10, 5) = ")
(display (pascal 10 5))
(display " (binomial: ")
(display (pascal-binomial 10 5))
(display ")\n")

(newline)
(display "Properties of Pascal's Triangle:\n")
(display "1. Each entry is sum of two entries above it\n")
(display "2. Row n has n+1 entries\n")
(display "3. Entry (n,k) = C(n-1,k-1) = (n-1)!/((k-1)!(n-k)!)\n")
(display "4. Rows sum to powers of 2\n")
(display "5. Contains binomial coefficients\n")

(newline)
(display "Row sums (should be powers of 2):\n")
(define (row-sum row)
  "Calculate sum of all entries in a row"
  (define (sum-entries col total)
    (if (> col row)
        total
        (sum-entries (+ col 1) (+ total (pascal row col)))))
  (sum-entries 1 0))

(define (test-row-sums max-row)
  (define (test-row row)
    (if (<= row max-row)
        (begin
          (display "Row ")
          (display row)
          (display ": sum = ")
          (display (row-sum row))
          (display " = 2^")
          (display (- row 1))
          (newline)
          (test-row (+ row 1)))))
  (test-row 1))

(test-row-sums 6)