#lang racket

#| Lab number: 3
   Total number of programs: 4
   Note: Uncomment function calls whenever necessary
|#

;1. Check whether the entered number is prime or not
(define (smallestdiv n)
  (define (divides? a b) (= (remainder a b) 0))
  (define (square a) (* a a))
  (define (loop iter n)
    (cond ((> (square iter) n) n)
           ((divides? n iter) iter)
           (else (loop (+ iter 1) n))))
    (loop 2 n))
(define (checkprime n)
  (cond ((= (smallestdiv n) n) (display "Prime\n"))
        ( else (display "Not prime\n"))))
#|Function Calls:
(checkprime 2)
(checkprime 5)
(checkprime 7)
(checkprime 10)
|#

;2. Define a procedure to calculate x2 + y2 + z2
(define (squaresum x y z)
  (define (square a) (* a a))
  (+ (square x) (square y) (square z)))
#|Function Calls:
(squaresum 2 2 3)
(squaresum 4 2 5)
|#

;3. Define a procedure to calculate x2 + y2 + z2 using lambda
(define sumLambda1 (lambda (x y z) (+ (* x x) (* y y) (* z z))))
(define sumLambda2 (lambda (x) (lambda (y z) (+ (* x x) (* y y) (* z z)))))
(define sumLambda3 (lambda (x) (lambda (y) (lambda (z) (+ (* x x) (* y y) (* z z))))))
#|Function Calls:
(sumLambda1 5 6 7)
((sumLambda2 5) 6 7)
(((sumLambda3 5) 6) 7)
|#

;4. Define a procedure to calculate x2 + (1+x)2 + x(1+x)2 using lambda and let
(define (sumLetLambda x)
 (let((a x)) ((lambda(x) ( + (* x x) (* (+ x 1) (+ x 1)) (* x (* (+ x 1) (+ x 1))))) a)))
#|Function Calls:
(sumLetLambda 2)
(sumLetLambda 4)
|#