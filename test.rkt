#lang racket

(require cirrusepal/transform)

(define args (current-command-line-arguments))

(define (run)
  (if (not (equal? (vector-length args) 1))
    (error "pass one argument as filepath")
    (+ 1 2))

  (define file (vector-ref args 0))
  (define list (cirrusepal-compile (file->string file) file))
  (eval list (make-base-namespace)))

(run)
