#lang br/quicklang
(require "parser.rkt")

(define (read-syntax path port)
  (define partse-tree (parse path (make-tokenizer port)))
  (define module-datum `(module bf-mod "expander.rkt"
                          ,parse-tree))
  (datum->syntax #f module-datum))

(provide read-syntax)


(define (make-tokenizer port)
  (define (next-token)
    )
  next-token)