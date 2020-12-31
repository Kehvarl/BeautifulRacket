#lang br/quicklang

(define-macro (bf-module-begin PARSE-TREE)
  #'(#%module-begin
     PARSE-TREE))
(provide (rename-out [bf-module-begin #%module-begin]))

(define (fold-funcs apl bf-funcs)
  (for/fold ([current-apl apl])
            ([bf-func (in-list bf-funcs)])
       (apply bf-func current-apl)))

(define-macro (bf-program OP-OR-LOOP-ARG ...)
  #'(begin
      (define first-apl (list (make-vector 30000 0) 0))
      (void (fold-funcs first-apl (list OP-OR-LOOP-ARG ...)))))
(provide bf-program)

(define-macro (bf-loop "[" OP-OR-LOOP-ARG ... "]")
  #'(lambda (arr ptr)
      (for/fold ([current-apl (list arr ptr)])
                ([i (in-naturals)]
                 #:break (zero? (apply current-byte
                                       current-apl)))
        (fold-funcs current-apl (list OP-OR-LOOP-ARG ...)))))
(provide bf-loop)

(define-macro-cases bf-op
  [(bf-op ">") #'bf-next]
  [(bf-op "<") #'bf-prev]
  [(bf-op "+") #'bf-inc]
  [(bf-op "-") #'bf-dec]
  [(bf-op ".") #'bf-write]
  [(bf-op ",") #'bf-read])
(provide bf-op)

(define (current-byte arr ptr) (vector-ref arr ptr))

(define (set-current-byte arr ptr val)
  (define new-arr (vector-copy arr))
  (vector-set! new-arr ptr val)
  new-arr)

(define (bf-next arr ptr) (list arr (add1 ptr)))
(define (bf-prev arr ptr) (list arr (sub1 ptr)))

(define (bf-inc arr ptr) (list
                       (set-current-byte arr ptr (add1 (current-byte arr ptr)))
                       ptr))
(define (bf-dec arr ptr) (list
                       (set-current-byte arr ptr (sub1 (current-byte arr ptr)))
                       ptr))

(define (bf-write arr ptr)
  (write-byte (current-byte arr ptr))
  (list arr ptr))
(define (bf-read arr ptr)
  (list (set-current-byte arr ptr (read-byte ptr)) ptr))

      
