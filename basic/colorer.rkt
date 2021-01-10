#lang br
(require "lexer.rkt" brag/support)
(provide basic-colorer)

(define (basic-colorer port)
  (define srcloc-tok (basic-lexedr port))
  ...)

