#lang racket

#| Lab number: 2
   Total number of programs: 7
   Note: Uncomment function calls whenever necessary
|#

;1. Define absolute procedure
(define (abs x)
  (cond ((> x 0) x)
        ((< x 0) (- x))
        ((= x 0) 0)))
#|Function Calls:
(abs 3)
(abs -3)
(abs 0)
|#

;2. Define a procedure to identify whether a given number is positive/negative/zero
(define (identify x)
  (cond ((> x 0) (display "Positive Number"))
        ((< x 0)(newline)(display "Negative Number"))
        ((= x 0)(newline)(display "Zero"))))
#|Function Calls:
(identify 5)
(identify 0)
(identify -2)
|#

;3. Find the sum of n natural numbers - linear recursive
(define (sumOfNumbers n)
  (if (> n 0)
      (+ n (sumOfNumbers (- n 1)))
      0))
#|Function Calls:
(sumOfNumbers 3)
(sumOfNumbers 7)
(sumOfNumbers 8)
|#

;4. Find the sum of n natural numbers - linear iterative
(define (sumNum ans n)
   (if (= n 0)
       ans
       (sumNum (+ ans n) (- n 1))))
#|Function Calls:
(sumOfNumbers 9)
(sumOfNumbers 5)
(sumOfNumbers 4)
|#

;5. Find the sum of n natural numbers - linear iterative (Use block structure and lexical scoping concept)
(define (sumNumbers n)
  (define (subProcedure ans x)
    (if (= x 0)
        ans
        (subProcedure (+ ans x) (- x 1))))
  (subProcedure 0 n))
#|Function Calls:
(sumNumbers 4)
(sumNumbers 8)
(sumNumbers 9)
|#

;6. Find the nth fibonacci number - first position is 0th position
(define (fibonacci n)
  (if (< n 2)
       n
      (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))
#|Function Calls:
(fibonacci 0)
(fibonacci 1)
(fibonacci 2)
(fibonacci 3)
(fibonacci 4)
(fibonacci 5)
|#

;7. Find GCD of two numbers
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
#|Function Calls:
(gcd 28 16)
(gcd 9 21)
(gcd 15 25)
|#
