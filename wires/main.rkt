#lang br/quicklang

(module+ reader 
  (provide read-syntax))
  
(define (read-syntax path port)
  (define wire-datums
    (for/list ([wire-str (in-lines port)])
      (format-datum '(wire ~a) wire-str)))
  (strip-bindings
   #`(module wires-mod wires/main
       #,@wire-datums))
  )


(provide #%module-begin)


(define-macro-cases wire
  [(wire ARG -> ID) ...]
  [(wire OP ARG -> ID) ...]
  [(wire ARG1 OP ARG2 -> ID) ...]
  [else ...])
  