#lang racket

#|
Topic: Concurrency
Day: #2
Date: 15-11-2021
Note: Programs are not to be run as inbuilt functions are not supported,
so these codes aren't verified
|#

(define (make_account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin
          (set! balance (-balance amount))
          balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((protected (make-serialiser)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) (protected withdraw))
            ((eq? m 'deposit)(protected deposit))
            ((eq? m 'balance) balance)
            (else (error "Unknown request: MAKE-ACCOUNT" m))))
    dispatch))

