#lang racket

#|
Topic: Complex numbers
Day: #1
Date: 19-10-2021
|#

; Complex number - rectangular representation
(define (real_part z) (car z))

(define (imag_part z) (cdr z))

(define (square x) (* x x))

(define (magnitude z)
  (sqrt
   (+ (square (real_part z))
      (square (imag_part z)))))

(define (angle z)
  (atan (imag_part z) (real_part z)))

(define (make_from_real_imag x y)
  (cons x y))

(define (make_from_mag_ang r a)
  (cons (* r (cos a)) (* r (sin a))))

; Complex number - polar representation
(define (real_part_p z)
  (* (magnitude z) (cos (angle z))))

(define (imag_part_p z)
  (* (magnitude z) (sin (angle z))))

(define (magnitude_p z) (car z))

(define (cccccangle z) (cdr z))


(define (make_from_real_imag_p x y)
  (cons (sqrt (+ (square x) (square y))) (atan y x)))

(define (make_from_mag_ang_p r a) (cons r a))

;operations on complex numbers
(define (add_complex z1 z2)
  (make_from_real_imag
   (+ (real_part z1) (real_part z2))
   (+ (imag_part z1) (imag_part z2))))

(define (sub_complex z1 z2)
  (make_from_real_imag
   (- (real_part z1) (real_part z2))
   (- (imag_part z1) (imag_part z2))))

(define (mul_complex z1 z2)
       (make_from_mag_ang (* (magnitude z1) (magnitude z2))
                          (+ (angle z1) (angle z2))))

(define (div_complex z1 z2)
       (make_from_mag_ang (/ (magnitude z1) (magnitude z2))
                          (- (angle z1) (angle z2))))