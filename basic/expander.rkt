#lang br/quicklang

(define-macro (b-line NUM STATEMENT ...)
  (with-pattern ([LINE-NUM (prefix-id "line-" #'NUM
                                      #:source #'NUM)])
    (syntax/loc caller-stx
                (define (LINE-NUM) (void) STATEMENT ...))))

(define-macro (b-module-begin (b-program LINE ...))
  #'(#%module-begin
     LINE ...
     (define line-table
       (apply hasheqv (append (list NUM LINE-FUNC) ...)))
     (void (run line-table))))
(provide (rename-out [b-module-begin #%module-begin]))