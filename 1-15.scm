;;; Exercise 1.15 - Sine Approximation and Order of Growth Analysis
;;; Demonstrates recursive procedure calls and computational complexity

(define (cube x) 
  "Compute the cube of x"
  (* x x x))

(define (p x) 
  "Apply trigonometric transformation: p(x) = 3x - 4x³"
  (- (* 3 x) (* 4 (cube x))))

;;; Instrumented version to count procedure calls
(define call-count 0)

(define (reset-counter!)
  "Reset the procedure call counter"
  (set! call-count 0))

(define (sine angle)
  "Compute sine using recursive approximation"
  (if (not (> (abs angle) 0.1))
      angle
      (begin
        (set! call-count (+ call-count 1))
        (p (sine (/ angle 3.0))))))

;;; Educational demonstration
(display "=== Exercise 1.15: Sine Approximation Analysis ===")
(newline)
(newline)

(display "The sine procedure uses the reduction:")
(newline)
(display "sin(x) = 3*sin(x/3) - 4*sin³(x/3)  when |x| > 0.1")
(newline)
(display "sin(x) = x                          when |x| ≤ 0.1")
(newline)
(newline)

(define (test-sine angle)
  "Test sine calculation and show analysis"
  (reset-counter!)
  (let ((result (sine angle)))
    (display "sin(")
    (display angle)
    (display ") = ")
    (display result)
    (display " (calls to p: ")
    (display call-count)
    (display ")")
    (newline)))

(display "Testing different angles:")
(newline)
(test-sine 0.05)    ; Should not call p (angle ≤ 0.1)
(test-sine 0.1)     ; Boundary case
(test-sine 0.2)     ; Should call p once
(test-sine 0.3)     ; Should call p once  
(test-sine 1.0)     ; Should call p multiple times
(test-sine 3.0)     ; Should call p multiple times
(test-sine 12.15)   ; Larger angle

(newline)
(display "Manual trace for sine(0.2):")
(newline)
(display "sine(0.2) -> p(sine(0.2/3)) -> p(sine(0.0667))")
(newline)
(display "Since 0.0667 ≤ 0.1, sine(0.0667) = 0.0667")
(newline)
(display "So p(0.0667) = 3*0.0667 - 4*(0.0667)³")
(newline)

(reset-counter!)
(let ((detailed-result (sine 0.2)))
  (display "Result: ")
  (display detailed-result)
  (display " with ")
  (display call-count)
  (display " calls to p")
  (newline))

(newline)
(display "Order of Growth Analysis:")
(newline)
(display "- Each call reduces angle by factor of 3")
(newline)
(display "- Number of calls ≈ log₃(angle/0.1)")
(newline)
(display "- Time complexity: Θ(log n)")
(newline)
(display "- Space complexity: Θ(log n) due to recursive calls")
(newline)

(newline)
(display "For sine(12.15):")
(display " Number of divisions by 3 until ≤ 0.1:")
(newline)
(let ((angle 12.15)
      (divisions 0))
  (display "12.15")
  (while (> angle 0.1)
    (set! angle (/ angle 3.0))
    (set! divisions (+ divisions 1))
    (display " -> ")
    (display angle))
  (newline)
  (display "Total divisions: ")
  (display divisions)
  (newline))