#lang racket

#|
Topic: SICP Mutators - Representation of Queues
Day: #1
Date: 11-11-2021
|#

; set-car! and set-cdr! are mutators
;How to make an empty queue?
;insert-queue! and delete-queue! are mutators
;mutators may not be supported in racket

(define (front_ptr queue) (car queue))
(define (rear_ptr queue) (cdr queue))
(define (set_front_ptr! queue item)
  (set-car! queue item))
(define (set_rear_ptr! queue item)
  (set-cdr! queue item))

(define (empty_queue? queue)
  (null? (front_ptr queue)))

(define (make_queue) (cons '() '()))

(define (front_queue queue)
  (if (empty_queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front_ptr queue))))

(define (insert_queue! queue item)
  (let ((new_pair (cons item '())))
  (cond ((empty_queue? queue)
         (set_ffront_ptr! queue new_pair)
         (set_rear_ptr! queue new_pair)
         queue)
        (else
         (set-cdr! (rear_ptr queue) new_pair)
         (set_rear_ptr! queue new_pair)
         queue))))

(define (delete_queue! queue)
  (cond ((empty_queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else (set_front_ptr! queue (cdr (front_ptr queue)))
              queue)))
  