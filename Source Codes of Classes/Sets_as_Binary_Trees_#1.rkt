#lang racket

#|
Topic: Sets as Binary Trees
Day: #1
Date: 11-10-2021
|#

; '(3 (2 null null) (7 null null)) is the set representation of a binary tree
; Root: 3, Left Child: 2, Right Child: 7

(define (entry tr) (car tr))
(define (left-branch tr) (cadr tr))
(define (right-branch tr) (caddr tr))
(define (make-tree entry left right)
  (list entry left right))

;Performing search operation
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

;Performing binary tree insertions
(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))
        