#lang br
(require "lexer.rkt" brag/support)
(provide basic-colorer)

(define (basic-colorer port)
  (define (handle-lexer-error excn)
    (define excn-srclocs (exn:fail:read-srclocs excn))
    (srcloc-token (token 'ERROR) (car excn-srclocs)))
      
  (define srcloc-tok
    (with-handlers ([exn:fail:read? handle-lexer-error])
      (basix-lexer port)))
  ...)

