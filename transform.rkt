#lang racket

(require cirruparser/parser)

(provide cirrusepal-compile)

(define (cirrusepal-compile code file)
  (define tree (cirruparser-pare code file))
  (define body (transform tree))
  (append (list (quote begin)) body))

(define (transform node)
  (if (list? node)
    (map transform node)
    (cond
      ((string->number node) (string->number node))
      ((equal? node "#t") #t)
      ((equal? node "#f") #f)
      (
        (and
          (> (string-length node) 0)
          (equal? (substring node 0 1) ":"))
        (substring node 1))
      (else (string->symbol node)))))
