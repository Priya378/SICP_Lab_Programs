#lang racket

#|
Topic: Streams
Day: #1
Date: 16-11-2021
Note: Programs are not to be run as inbuilt functions are not supported,
so these codes aren't verified
|#

(define (sum_primes a b)
  (define (iter count accum)
    (cond ((> count b) accum)
          ((prime? count)
           (iter (+ count 1) (+ count accum)))
          (else (iter (+ count 1) accum))))
  (iter a 0))

(define (sum_primes a b)
  (accumulate +
              0
              (filter prime?
                      (enumerate-interval a b))))

;generating 2nd prime in an inefficient way

(car (cdr (filter prime?
                  (enumerate-interval 10000 1000000))))

;(stream-car (cons-stream x y)) = x
;(stream-cdr (cons-stream x y)) = y

(define (stream_ref s n)
  (if (= n 0)
      (stream-car s)
      (stream_ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin
        (proc (sream-car s))
        (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x) (newline) (display x))

;(cons-stream <a> <b>) same as
;(cons <a> (delay <b>))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

;result is
;(cons 10000
; (delay (stream-enumerate-interval 10001 1000000)))

(cons 10007
      (delay (stream-filter
              prime?
              (cons 10008
                    (delay (stream-enumerate-interval
                            1009
                            1000000))))))
