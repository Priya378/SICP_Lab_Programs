#lang racket

#|
Topic: Modularity
Day: #1
Date: 22-10-2021, block period
|#

;(set! <name> <new-value>)
;(begin <exp1> <exp1>)

(define bal 100) ;variable bal
(define (withdraw amt)
  (if (>= bal amt)
      (begin
        (set! bal (- bal amt))  ;modifying balance value
        bal)  ;returning new balance value
      "Insufficient bal"))
;Drawback: Here global variable gets modified all the time

(define new_with
  (let ((bal 100))
    (lambda (amt)
      (if (>= bal amt)
        (begin
        (set! bal (- bal amt))  ;modifying balance value
        bal)  ;returning new balance value
      "Insufficient bal"))))
;Drawback: For each user we have to create

(define (make_withdraw bal)
  (lambda (amt)
    (if (>= bal amt)
        (begin (set! bal (- bal amt))
               bal)
        "Insufficient bal")))

;((make_withdraw 1000) 50)
;(define a (make_withdraw 5000))
;(a 200) => a's bal=4800
;(a 300) => a's bal=4500

;(define w1 (make_withdraw 100))
;(w1 30) => returns 70

;----------------3rd hour ends, 4th hour begins-------------------------

(define (make_account balance)
 (define (withdraw amount)
   (if (>= balance amount)
       (begin
         (set! balance (- balance amount))
         balance)
       "Insufficient funds"))
  (define (deposit amount)
         (set! balance (+ balance amount))
         balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else
           (error "Unknown request: MAKE-ACCOUNT" m))))
  dispatch)
;(define A (make_account 1000))
;(A 'deposit)=> calls deposit procedure
;((A 'deposit) 50) => passing 50 as a parameter to deposit

(define (make_simplified_withdraw balance)
  (lambda (amount)
    (set!
     balance (- balance amount))
    balance))
;without any conditions, updates the balance of the object, w1 and w2 (say 2 objects) differ

(define (make_decrementer balance)
  (lambda (amount)
    (- balance amount)))
;changes won't get updated, D1 D2 (say 2 objects) will be same

;Imperative programming (extensive use of assignment (set!))

(define (factorial n)
  (let ((product 1)
        (counter 1))
    (define (iter)
      (if (> counter n)
          product
          (begin
            (set! product (* counter product))
            (set! counter (+ counter 1))
            (iter))))
  (iter)))
