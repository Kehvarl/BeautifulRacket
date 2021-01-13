#lang br
(provide b-sum b-expr)

(define (b-sum . nums)
  (if (= 1 (length nums))
      (car nums)
      (apply + nums)))

(define (b-expr expr)
  (if (integer? expr) (inexact->exact expr) expr))
