#lang br/quicklang
(require "parser.rkt" "tokenizer.rkt")

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-bindings
   #`(module basic-parser-mod basic/parse-only
       #,parse-tree)))
(module+ reader (provide read-syntax))

(define-macro (parse-only-mb PARSE-TREE)
  #'(#%module-begin
     'PARSE-TREE))
(provide (rename-out [parse-only-mb #%module-begin]))