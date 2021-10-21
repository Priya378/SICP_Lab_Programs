#lang racket

#|
Topic: Using tagged data to represent Complex numbers
Day: #1
Date: 21-10-2021
|#

(define (attach_tag type_tag contents)
  (cons type_tag contents))

(define (type_tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum: TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum: CONTENTS" datum)))

(define (rectangular? z)
  (eq? (type_tag z) 'rectangular))

(define (polar? z)
  (eq? (type_tag z) 'polar))

;Complex number - rectangular representation
(define (real_part_rectangular z)
  (car z))

(define (imag_part_rectangular z)
  (cdr z))

(define (square x) (* x x))

(define (magnitude_rectangular z)
  (sqrt (+ (square (real_part_rectangular z))
           (square (imag_part_rectangular z)))))

(define (angle_rectangular z)
  (atan (imag_part_rectangular z)
        (real_part_rectangular z)))

(define (make_from_real_imag_rectangular x y)
  (attach_tag 'rectangular (cons x y)))

(define (make_from_mag_ang_rectangular r a)
  (attach_tag 'rectangular (cons (* r (cos a)) (* r (sin a)))))

;Complex number - polar represntation
(define (real_part_polar z)
  (* (magnitude_polar z) (cos (angle_polar z))))

(define (imag_part_polar z)
  (* (magnitude_polar z) (sin (angle_polar z))))

(define (magnitude_polar z) (car z))

(define (angle_polar z) (cdr z))

(define (make_from_real_imag_polar x y)
  (attach_tag 'polar
              (cons (sqrt (+ (square x) (square y)))
                    (atan y x ))))

(define (make_from_mag_ang_polar r a)
  (attach_tag 'polar (cons r a)))

;Generic Selectors
(define (real_part z)
  (cond ((rectangular? z)
         (real_part_rectangular (contents z)))
        ((polar? z)
         (real_part_polar (contents z)))
        (else
         (error "Unknown type: REAL-PART" z))))

(define (imag_part z)
  (cond ((rectangular? z)
         (imag_part_rectangular (contents z)))
        ((polar? z)
         (imag_part_polar (contents z)))
        (else
         (error "Unknown type: IMAGINARY-PART" z))))

(define (magnitude z)
  (cond ((rectangular? z)
         (magnitude_rectangular (contents z)))
        ((polar? z)
         (magnitude_polar (contents z)))
        (else
         (error "Unknown type: MAGNITUDE" z))))

(define (angle z)
  (cond ((rectangular? z)
         (angle_rectangular (contents z)))
        ((polar? z)
         (angle_polar (contents z)))
        (else
         (error "Unknown type: ANGLE" z))))
         
(define (make_from_real_imag x y)
  (make_from_real_imag_rectangular x y))

(define (make_from_mag_ang r a)
  (make_from_mag_ang_polar r a))

(define (add_complex z1 z2)
  (make_from_real_imag
   (+ (real_part z1) (real_part z2))
   (+ (imag_part z1) (imag_part z2))))

