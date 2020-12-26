#lang br/quicklang

(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '(handle ~a) src-lines))
  (datum->syntax #f `(module stacker-mod "stacker.rkt"
                       ,@src-datums)))

(provide read-syntax)