#lang racket

#| Lab number: 1
   Total number of programs: 6
   Note: Uncomment function calls whenever necessary
|#

;1. Find sum of two numbers
(define (sum x y)
  (+ x y))
#|Function Calls:
(sum 2 3)
(sum 5 7)
|#

;2. Find the area of a circle (pi is a built in variable)
(define (circleArea r)
  (* pi r r))
#|Function Calls:
;(circleArea 2)
;(circleArea 5)
|#

;3. Find the greater of two numbers
(define (greaterOfTwo x y)
  (if (> x y) "First input is greater" "Second input is greater"))
#|Function Calls:
(greaterOfTwo 5 4)
(greaterOfTwo 5 9)
|#

;4. Find the greatest of three numbers
(define (greatestOfThree x y z)
  (if( > x y)
     (if (> x z)
         "First input is the greatest" "Third input is the greatest")
     (if ( > y z)
         "Second input is the greatest" "Third input is the gretaest")))
#|Function Calls:
(greatestOfThree 11 15 7)
(greatestOfThree 17 15 7)
(greatestOfThree 17 15 27)
|#

;5. Check whether the entered number is divisble by 7
(define (divisibleBy7 x)
  (if (= (remainder x 7) 0) "Yes" "No"))
#|Function Calls:
(divisibleBy7 15)
(divisibleBy7 7)
|#

;6. Find the sum of squares of two biggest numbers given three numbers
(define (sumOfSquares_greatestTwo x y z)
  (define (op a b)
    (+ (* a a) (* b b)))
  
  (if( > x y)
     (if (> y z)
         (op x y) (op x z))
     (if ( > x z)
         (op x y) (op y z))))
#|Function Calls:
(sumOfSquares_greatestTwo 2 4 3)
(sumOfSquares_greatestTwo 6 4 3)
(sumOfSquares_greatestTwo 6 2 5)
|#




