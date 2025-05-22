(define (square x) (* x x))

(define (sum-of-larger a b c)
  (cond ((and (> a c) (> b c)) (+ (square a) (square b))) 
	((and (> a b) (> c b)) (+ (square a) (square c)))
	((and (> c a) (> b a)) (+ (square c) (square b)))))
