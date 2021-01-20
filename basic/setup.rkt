#lang br
(require "parser.rkt" "tokenizer.rkt")
(provide basic-output-port do-setup!)

(define basic-output-port
  (make-parameter (open-output-nowhere)))

(define repl-parse (make-rule-parser b-repl))

(define (do-setup!)
  (basic-output-port (current-output-port)))