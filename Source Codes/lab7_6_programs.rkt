#lang racket

#| Lab number: 7
   Date: 1/10/2021
   Total number of programs: 6
   Note: Uncomment function calls whenever necessary
|#

;Declaring basic sequence operations for lists: map, filter, accumulate(acc), enumerate(enum)
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
;1. Define a procedure to count the number of sub-trees.
(define (sub-trees tr)
(cond ((null? tr) 0)
      ((pair? (car tr))(+ (+ 1 (sub-trees (car tr)))
                          (sub-trees (cdr tr))))
      (else (sub-trees (cdr tr)))))
#|Function Calls:
(sub-trees '(1 2 3))
(sub-trees '(1 (2 4) (5 6 (7 8)) 3))
(sub-trees '((1 2) (3 4)))
(sub-trees '(1 (2 (3 (4))) 5 6))
|#

;2. Define a procedure to find product of even numbers from a range of numbers
; withouth using sequence of procedure concept
(define (prodEven arr)
  (cond ((null? arr) 1)
        ((if (= (modulo (car arr) 2) 0) (* (car arr) (prodEven (cdr arr)))
             (prodEven (cdr arr))))))
#|Function Calls:
(prodEven (enum 1 7))
(prodEven (enum 2 5))
|#

;3. Define a procedure to find product of even numbers from a range of numbers
; using sequence of procedure concept
(define (productEven arr)
  (acc * 1
  (filter (lambda (x) (= (modulo x 2) 0)) arr)))
#|Function Calls:
(productEven (enum 1 7))
(productEven (enum 4 8)) 
|#

;4. Define a procedure to find product of even numbers from a given tree
; using sequence of procedure concept
(define (productEvenT tr)
  (accT * 1
  (filterT (lambda (x) (= (modulo x 2) 0)) tr)))
#|Function Calls:
(productEvenT '(1 2 (3 (4 5)) 6))
(productEvenT '(2 (4 5)))
|#

;5. Define a procedure to list all odd numbers after squaring the elements from a given
;range of elements - using sequence of procedure concept
(define (oddSquare arr)
  (filter
   (lambda (x) (= (modulo x 2) 1))
   (map
    (lambda (x) (* x x)) arr)))
#|Function Calls:
(oddSquare (enum 1 7))
(oddSquare (enum 3 9))
|#

;5. Define a procedure to list all odd numbers after squaring the elements from a given
;tree - using sequence of procedure concept
(define (oddSquareT tr)
  (filterT
   (lambda (x) (= (modulo x 2) 1))
   (mapT
    (lambda (x) (* x x)) tr)))
#|Function Calls:
(oddSquareT '(1 (2 3 4 5) 6 7 8))
(oddSquareT '(1 2 3 4))
|#