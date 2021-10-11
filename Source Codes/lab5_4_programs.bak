#lang racket

#| Lab number: 5
   Total number of programs: 4
   Note: Uncomment function calls whenever necessary
|#

;1. Define a procedure to add all the elements of a given list
(define (addinList arr)
  (cond
    ((null? arr) 0)
    (else (+ (car arr) (addinList (cdr arr))))))
#|Function Calls:
(addinList '(1 2 3))
(addinList '())
|#

;2. Define a procedure to accept a list as its argument and return a list of square of elements
(define (squareList arr)
  (cond
    ((null? arr) 0)
    (else (+ (* (car arr) (car arr)) (squareList (cdr arr))))))
#|Function Calls:
(squareList '(1 2 3))
(squareList '(4 9))
|#

;3. Define a procedure to return the element at corresponding position - Elements start from 0th position
(define (findEle arr pos) 
(define (subFindEle arr pos counter)
  (cond
    ((null? arr)0)
    ((= counter pos) (car arr))
    ( else (subFindEle (cdr arr) pos (+ counter 1)))))
(subFindEle arr pos 0))
#|Function Calls:
(findEle '(9 8 7 6) 1)
(findEle '(7 6) 0)
|#

;4. Define a procedure to reverse the elements of a list.
(define (reverseList arr)
  (cond
    ((null? arr)'())
    (else (append (reverseList (cdr arr)) (list (car arr))))))
#|Function Calls:
(reverseList '(1 2 3 4))
(reverseList '())
|#

