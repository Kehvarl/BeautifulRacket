#lang br/quicklang

(define-macro (bf-module-begin PARSE-TREE)
  #'(#%module-begin
     PARSE-TREE))
(provide (rename-out [bf-module-begin #%module-begin]))

(define-macro (bf-program OP-OR-LOOP-ARG ...)
  #'(void OP-OR-LOOP-ARG ...))
(provide bf-program)

(define-macro (bf-loop "[" OP-OR-LOOP-ARG ... "]")
  #'(until (zero? (current-byte))
           OP-OR-LOOP-ARG ...))
(provide bf-loop)

(define-macro-cases bf-op
  [(bf-op ">") #'(bf-next)]
  [(bf-op "<") #'(bf-prev)]
  [(bf-op "+") #'(bf-inc)]
  [(bf-op "-") #'(bf-dec)]
  [(bf-op ".") #'(bf-out)]
  [(bf-op ",") #'(bf-in)])
(provide bf-op)

(define arr (make-vector 30000 0))
(define ptr 0)

(define (current-byte) (vector-ref arr ptr))
(define (set-current-byte! val) (vector-set! arr ptr val))

(define (bf-next) (set! ptr (add1 ptr)))
(define (bf-prev) (set! ptr (sub1 ptr)))

(define (bf-inc) (set-current-byte! (add1 (current-byte))))
(define (bf-dec) (set-current-byte! (sub1 (current-byte))))

(define (bf-out) (write-byte (current-byte)))
(define (bf-in) (set-current-byte! (read-byte)))
