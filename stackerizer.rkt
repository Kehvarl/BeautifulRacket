#lang br/quicklang
(provide * +)

(define-macro (stackerizer-mb EXPR)
  #'(#%module-begin
     EXPR))
(provide (rename-out [stackerizer-mb #%module-begin]))