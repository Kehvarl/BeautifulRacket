#lang br/quicklang

(define-macro (jsonic-mb PARSE-TREE)
  #'(#%module-begin
     ...))
(provide (rename-out [jsonic-md #%module-begin]))