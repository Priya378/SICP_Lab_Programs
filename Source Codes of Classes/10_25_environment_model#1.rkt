#lang racket

#|
Topic: Environment Model
Day: #1
Date: 25-10-2021
|#

;Enviroment: another name for memory
;Frame-> Box, blocks of frames can be called environment
;Frames can be referred using pointers
;Network of frames implements inheritance
#| The environment model od evaluation replaces the substition model in specifying
what it means to apply a compound procedure to arguments |#

#|
(define (square x)
  (* x x))
represented internally as
(define square
  (lambda (x) (* x x)))
|#

#|
Square variable has:
2 pointers:
1. (parameters: x ; body: (* x x)
2. global env -> (other variables, name square(which points to procedure again))
|#

#|
Let's say we have (define a 10), then it will be put in the global environment
|#

#|
Let's say we have procedure call (square 5), the a separate frame must be created
That frame points to global environment
That frame will be released as soon as the function successfully returns
|#

;Applying simple procedure
(define (square x)
  (* x x))
(define (sum_of_squares x y)
  (+ (square x) (square y)))
(define (f a)
  (sum_of_squares (+ a 1) (* a 2)))
;Check the images uploaded
;Frames associated with function calls are released as soon as functions exexutions are done






