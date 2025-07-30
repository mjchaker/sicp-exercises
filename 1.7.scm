(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-mod x)
  (define (good-enough? guess)
    (< (/ (abs (- (improve guess) guess)) guess) 0.00000000001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))  
  (sqrt-iter 1.0))

;; Original good-enough?

;;(define (good-enough? guess x)
  ;;(< (abs (- (improve guess x)
    ;;     guess))
     ;;(* guess .001)))
