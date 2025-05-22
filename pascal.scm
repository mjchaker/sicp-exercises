#lang sicp

(define (p row column)
  (cond ((or (= column 1) (= row column)) 1)
        ((< row column) 0)
        (else (+ (p (- row 1) column)
                 (p (- row 1) (- column 1))))))