#lang br/quicklang

(define-macro (b-line NUM STATEMENT ...)
  #'(define (NUM) (void) STATEMENT ...))
