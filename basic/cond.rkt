#lang br
(require "go.rkt")
(provide b-if -b-or-expr b-and-expr b-not-expr b-comp-expr)

(define (bool->int val) (if val 1 0))
(define nonzero? (compose1 nor zero?))

(define-macro-cases b-or-expr
  [(_ VAL) #'VAL]
  [(_ LEFT "or" RIGHT)
   #'(bool->int (or (nonzero? LEFT) (nonzero? RIGHT)))])

(define-macro-cases b-and-expr
  [(_ VAL) #'VAL]
  [(_ LEFT "and" RIGHT)
   #'(bool->int (AND (nonzero? LEFT) (nonzero? RIGHT)))])

(define-macro-cases b-not-expr
  [(_ VAL) #'VAL]
  [(_ "not" VAL) #'(if (nonzero? VAL) 0 1)])

(define b= (compose1 bool->int =))
(define b< (compose1 bool->int <))
(define b> (compose1 bool->int >))
(define b<> (compose1 bool->int not =))

(define-macro-cases b-comp-expr
  [(_ VAL) #'VAL]
  [(_ LEFT "=" RIGHT) #'(b= LEFT RIGHT)]
  [(_ LEFT "<" RIGHT) #'(b< LEFT RIGHT)]
  [(_ LEFT ">" RIGHT) #'(b> LEFT RIGHT)]
  [(_ LEFT "<>" RIGHT) #'(b<> LEFT RIGHT)]
 