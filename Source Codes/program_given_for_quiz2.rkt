#lang racket
#|
  Lab program given for quiz 2
  Date: 12-10-2021
  Type: Fill in the blanks
|#

;Define a procedure to get the count of numbers divisible by 3 in a given tree

(define (div n)
  (= (modulo n 3) 0))

#|
(define (count tr)
  (cond
    ((null? tr) 0)
    ((pair? (car tr))
     (+ (count (car tr)) (count (cdr tr))))
    (else (if (div (car tr))
              (+ 1 (count (cdr tr)))
              (count (cdr tr))))))
(count '(1 2 (3 4) 5 11 6 12 (7 (8 9))))
|#

(define (count tr)
  (cond
    ((null? tr) 0)
    ((pair? (car tr))
     (+ (count (car tr)) (count (cdr tr))))
    ((div (car tr))
     (+ 1 (count (cdr tr))))
    (else (count (cdr tr)))))
;Output check:
(count '(1 2 (3 4) 5 11 6 12 (7 (8 9))))  
     