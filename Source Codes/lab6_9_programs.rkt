#lang racket

#| Lab number: 6
   Date: 24/09/2021
   Total number of programs: 9 (3 in list, 6 in tree)
   Note: Uncomment function calls whenever necessary
|#

;1. Define a procedure to return sum of odd elements from the given list
(define (addOddinList arr)
  (cond
    ((null? arr) 0)
    ((= (modulo (car arr) 2) 0) (addOddinList (cdr arr)))
    (else (+ (car arr) (addOddinList (cdr arr))))))
#|Function Calls:
(addOddinList '(2 5 3 2 1))
(addOddinList '(2 4))
|#

;2. Define a procedure to return a list of odd elements from the given list
(define (oddList arr)
  (cond
    ((null? arr) '())
    ((= (modulo (car arr) 2) 0) (oddList (cdr arr)))
    (else (append (list (car arr)) (oddList (cdr arr))))))
#|Function Calls:
;(addOddinList '(2 5 3 2 1))
;(addOddinList '(2 4))
|#

;3. Define a procedure to search for an element from a given list
(define (searchEle arr k)
  (cond
    ((null? arr) "Not found")
    ((= (car arr) k) "Found")
    (else (searchEle (cdr arr) k))))
#|Function Calls:
(searchEle '(6 3 4) 5)
(searchEle '(6 3 4) 3)
|#

;4. Define a procedure to return sum of odd elements from the given tree
(define (oddSumTree tr)
  (cond ((null? tr) 0)
        ((pair? (car tr))
         (+ (oddSumTree (car tr)) (oddSumTree (cdr tr))))
         (else (if
                (= (modulo (car tr) 2) 1) (+ (car tr) (oddSumTree (cdr tr)))
                (oddSumTree (cdr tr))))))
#|Function Calls:
(oddSumTree '(1 2 (3 4 (5 6))))
(oddSumTree '(6 5 2 3))
|#

;5. Define a procedure to return a tree of odd elements from the given tree
(define (oddinTree tr)
  (cond ((null? tr) '())
        ((pair? (car tr))
         (append (list (oddinTree (car tr))) (oddinTree (cdr tr))))
         (else (if
                (= (modulo (car tr) 2) 1) (append (list (car tr)) (oddinTree (cdr tr)))
                (oddinTree (cdr tr))))))
#|Function Calls:
(oddinTree '(1 2 (3 4 (5 6))))
(oddinTree '(1 2 (3 4 (5 6))))
|#

;6. Define a procedure to search for an element from a given tree
(define (searchInTree tr k)
(define (searchEleTree tr)
  (cond ((null? tr) 0)
        ((pair? (car tr))
         (+ (searchEleTree (car tr)) (searchEleTree (cdr tr))))
        (else (if
               (= (car tr) k) 1
               (searchEleTree (cdr tr))))))
 (if (> (searchEleTree tr) 0) "True"
     "False"))
#|Function Calls:
(searchInTree '((1 2) 7 3 (2 4)) 9)
(searchInTree '((1 2) 7 3 (2 4)) 2)
|#

;7. Define a procedure to reverse the elements of a tree
(define (reverseTree tr)
  (cond ((null? tr) '())
        ((pair? (car tr))
         (append (reverseTree (cdr tr))
                 (list (reverseTree (car tr)))))
        (else (append (reverseTree (cdr tr))
                      (list (car tr))))))
#|Function Calls:
(reverseTree '(1 2 (3 4 (5 6))))
(reverseTree '((1 2) 7 3 (2 4)))
|#

;8. Define a procedure to increment all elements of tree by 5 (without using map)
(define (increment tr val)
  (cond ((null? tr) '())
        ((not (pair? tr)) (+ tr val))
        (else (cons (increment (car tr) val) (increment (cdr tr) val)))))
#|Function Calls:
(increment '(1 2 (3 4 (5 6))) 5)
(increment '(1 2 (3 4 (5 6))) 2)
|#

;9. Define a procedure to increment all elements of tree by 5 (using map)
(define (incTree tr val)
(define (map proc items)
  (cond ((null? items) null)
        ((pair? (car items)) (append (list (map proc (car items))) (map proc (cdr items))))
        (else (cons (proc (car items))
                    (map proc (cdr items))))))
(map (lambda(y) (+ y val)) tr))

#|Function Calls:
(incTree '(2 3 5) 5)
(incTree '(6 (2 3) (4 5) 7) 5)
|#
             
         