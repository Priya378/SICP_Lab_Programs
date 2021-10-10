#lang racket

#| Lab number: 3
   Total number of programs: 11
   6 Output Checks, 5 output generating questions
   Note: Uncomment function calls whenever necessary
|#

;Output Checks: 6
(cons 3 4)
(cons 3 (cons 4 5))
(cons (cons 1 2) 6)
(cons 8 (cons 5 (cons 7 null)))
(list 8 5 7)
(cons (cons 5 6) (cons 2 3))
(newline)

;Output generating questions: 5
;7. Desired output: '((1.2)3.4)
(cons (cons 1 2) (cons 3 4))

;8. Desired output: '((1.2)(3.4))
(cons (cons 1 2) (cons (cons 3 4) null))

;9. Desired output: '((1.2)3)
(cons (cons 1 2) (cons 3 null))

;10. Desired output: '(1(3)4)
(cons 1 (cons (cons 3 null) (cons 4 null)))

;11. Desired output: '(1(3).4)
(cons 1 (cons (cons 3 null) 4))
