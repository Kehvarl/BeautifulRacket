#lang br/quicklang

(define-macro (b-line NUM STATEMENT ...)
  (with-pattern ([LINE-NUM (prefix-id "line-" #'NUM)])
    #'(define (LINE-NUM) (void) STATEMENT ...)))
