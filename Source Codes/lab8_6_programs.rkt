#lang racket

#| Lab number: 8
   Date: 8/10/2021
   Total number of programs: 6
   Note: Uncomment function calls whenever necessary
|#

;Declaring basic sequence operations for lists: map, filter, accumulate (acc), enumerate (enum)
(define (map proc items)
  (cond ((null? items) null)
        (else (cons (proc (car items))
                    (map proc (cdr items))))))
;(map (lambda (x) (+ x 2)) '(1 2 3))

(define (filter predicate items)
  (cond ((null? items) null)
        ((predicate (car items))
         (cons (car items) (filter predicate (cdr items))))
        (else (filter predicate (cdr items)))))
;(filter (lambda (x) (= (modulo x 2) 1)) '(1 2 3 4 5 6))

(define (acc op init items)
  (cond ((null? items) init)
        (else (op (car items) (acc op init (cdr items))))))
;(acc + 0 '(1 2 3 4 5))

(define (enum low high)
  (if (> low high)
      null
      (cons low (enum (+ 1 low) high))))
;(enum 2 7)

;Declaring basic sequence operations for trees: map, filter, accumulate (acc)
(define (mapT proc items)
  (cond ((null? items) null)
        ((pair? (car items)) (cons (mapT proc (car items))
                             (mapT proc (cdr items))))
        (else (cons (proc (car items))
                    (mapT proc (cdr items))))))
;(mapT (lambda (x) (+ x 2)) '(1 2 (4 6) 3))

(define (filterT predicate items)
  (cond ((null? items) null)
        ((pair? (car items))(cons (filterT predicate (car items))
                             (filterT predicate (cdr items)))) 
        ((predicate (car items))
         (cons (car items) (filterT predicate (cdr items))))
        (else (filterT predicate (cdr items)))))
;(filterT (lambda (x) (= (modulo x 2) 1)) '(1 2 (3 (4 5)) 6))

(define (accT op init items)
  (cond ((null? items) init)
        ((pair? (car items)) (op (accT op init (car items))
                                 (accT op init (cdr items))))
        (else (op (car items) (accT op init (cdr items))))))
;(accT + 0 '(1 2 ((3 4) 5)))
;(accT * 1 '(1 2 ((3 4) 5)))

;Lab programs
;1. Define a procedure to find product of cube of all elements in a given tree
(define (cubeT tr)
  (cond
    ((null? tr) 1)
    ((pair? (car tr))
       (* (cubeT (car tr)) (cubeT (cdr tr))))
    (else
       (* (car tr) (car tr) (car tr) (cubeT (cdr tr))))))
#|Function Calls:
(cubeT '(1 2 (3 4)))
(cubeT '(2 (4 5)))
|#

;2. Define a procedure to find product of cube of all elements in a given tree
; using sequence of procedures
(define (cubeTS tr)
  (accT * 1
       (mapT (lambda(x) (* x x x)) tr)))
#|Function Calls:
(cubeTS '(1 2 (3 4)))
(cubeTS '(2 (4 5)))
|#

;3. Define a procedure, to find Fibonacci for a range of elements and return a list of all
;odd Fibonacci numbers
(define (fibOdd arr)
  (define (fib n)
    (if (< n 2) n
        (+ (fib (- n 1)) (fib (- n 2)))))
  (cond
    ((null? arr) '())
    (else
     (if (= (modulo (fib (car arr)) 2) 1)
      (cons (fib (car arr))
            (fibOdd (cdr arr)))
      (fibOdd (cdr arr))))))
#|Function Calls:
(fibOdd '(3 4 5 6 7 8 9 10))
(fibOdd '(0 1 2 3 4))
|#

;4. Define a procedure, to find Fibonacci for a range of elements and return a list of all
;odd Fibonacci numbers using sequence of procedures.
(define (fibOddS arr)
   (define (fib n)
    (if (< n 2) n
        (+ (fib (- n 1)) (fib (- n 2)))))
   (filter
    (lambda (x) (= (modulo x 2) 1))
    (map fib arr)))
#|Function Calls:
(fibOddS (enum 3 10))
(fibOddS (enum 0 4))
|#

;5. Define a procedure to increment all tree elements by 4 and return a list of even numbers
;using sequence of procedures
(define (procE tr)
  (filterT
   (lambda (x) (= (modulo x 2) 0))
   (mapT
    (lambda (x) (+ x 4))
    tr)))
#|Function Calls:
(procE '(1 2 (3 (4 5)) 6))
(procE '(3 4 5 6 7))
|#

;6. Define a procedure to increment all tree elements by 4 and return the sum of odd elements
;using sequence of procedures.
(define (procSumOdd tr)
  (accT + 0
        (filterT
         (lambda (x) (= (modulo x 2) 1))
         (mapT
          (lambda (x) (+ x 4))
          tr))))
#|Function Calls:
(procSumOdd '(1 2 (3 (4 5)) 6))
(procSumOdd '(3 4 5 6 7))
|#