
define (add1 x)
  + x 1

print (add1 3)

define (add-str a b)
  string-append a b

print (add-str :aaa :bbb)

define l1 (list 1 2 3 4 5)
define (show x)
  display x
  displayln :

for-each show l1

print ":test if:"
print (if (> 2 1) 2 3)
print (if #t 2 3)
