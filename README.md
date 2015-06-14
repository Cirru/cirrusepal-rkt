
Cirru Sepal in Racket
---

Convert Cirru to Racket quoted form of expression.

This is an experiment to program Racket in Cirru.

### Usage

```text
raco pkg install git://github.com/Cirru/cirrusepal-rkt
```

```rkt
#lang racket
(require cirrusepal/transform)

(eval
  (cirrusepal-compile "print 1" "filename")
  (make-base-namespace)))
```

### CLI

You can copy `test.rkt` with shebang(look at below) to create an excutable.

```racket
#!/usr/bin/env racket
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
```

### Development

Run this as a test:

```text
racket test.rkt examples/demo.cirru
```

### License

MIT
