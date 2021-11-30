#lang racket

#|
Topic: Concurrency
Day: #1
Date: 12-11-2021
Note: Programs are not to be run as inbuilt functions are not supported,
so these codes aren't verified
|#

(define (withdraw amount)
  (if (>= balance amount)
      (begin
        (set! balance (- balance amount))
        balance)
      "Insufficient funds"))

;balance = 100

;Peter:
(set! balance (+ balance 10))

;Paul:
(set! balance (- balance 20))

;Mary:
(set! balance (- balance (/ balance 2)))

;There are 9!/(3!3!3!) = 1680 possibile timing diagrams (seriously??)

;(parallel-execute <p1> <p2> ::: <pk>)

(define x 10)
(parallel-execute
 (lambda () (set! x (* x x)))
 (lambda () (set! x (+ x 1))))
;many possibilities

(define s (make-serializer))
(parallel-execute
 (s (lambda () (set! x (* x x))))
 (s (lambda () (set! x (+ x 1)))))
;only two possibilities, 101 or 121

(define x 10)
(define s (make-serializer))
(parallel-execute
 (lambda () (set! x ((s (lambda () (* x x))))))
 (s (lambda () (set! x (+ x 1)))))
;Three possibilities: 101, 121, 100


