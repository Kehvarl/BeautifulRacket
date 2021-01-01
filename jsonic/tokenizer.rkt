#lang br/quicklang
(require brag/support)

(define (make-tokenizer port)
  (define (next-token)
    (define jsonic-lexer
      (lexer
       ...))
    (jsonic-lexer port))
  next-token)
(provide make-tokenizer)
