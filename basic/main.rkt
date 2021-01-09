#lang br/quicklang
(require "parser.rkt" "tokenizer.rkt")

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-binding
   #`(module basic-mod basic/expander
       #,parse-tree)))

(module+ reader
  (provide read-syntax))