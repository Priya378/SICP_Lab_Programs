#lang racket

#|
Topic: Environment Model
Day: #2
Date: 28-10-2021
|#

;
(define (factorial1 n)
  (if (= n 1)
      1
      (* n (factorial1 (- n 1)))))
(factorial1 6)
;Try writing two pointer notation

(define (factorial n) (fact_iter 1 1 n))
(define (fact_iter product counter max_count)
  (if (> counter max_count)
      product
      (fact_iter (* counter product)
                 (+ counter 1)
                 max_count)))

(define (fact n)
  (define  (sub_fact p c m)
    (if (> c m)
        p
        (sub_fact (* p c) (+ c 1) m)))
(sub_fact 1 1 n))

