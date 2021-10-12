

Lisp Lab

8/4/2020

DEPT. OF CSE

1





Programs – Lab1

\1. Find sum of two numbers

\2. Find the area of a circle

\3. Find the largest of two numbers

\4. Find the largest of three numbers

\5. Check whether the entered number is divisible by 7.

\6. Find the sum of squares of two biggest numbers given three numbers

8/4/2020

DEPT. OF CSE

2





Programs – Lab2

Ø

Use ; for commenting any statements

Øanalyze the usage of division operator (/)

ØTo extract the remainder while dividing two

numbers

ØTo extract the quotient while dividing two numbers

Ø

8/4/2020

DEPT. OF CSE

3





Programs – Lab2

\1. Define absolute procedure.

\2. Define a procedure to identify whether a given number is positive / negative / zero

\3. Find the sum of *n* natural numbers –linear recursive

\4. Find the sum of *n* natural numbers –linear iterative

\5. Find the sum of *n* natural numbers –linear iterative (use block structure and lexical scoping

concept)

\6. Find the nth Fibonacci number

\7. find GCD of two numbers

8/4/2020

DEPT. OF CSE

4





Programs – Lab2

Ø Use racket with pictures

Ø #lang slideshow

Ø for Circle use circle procedure

ØFor Rectangle use rectangle procedure

8/4/2020

DEPT. OF CSE

5





Programs – Lab3

Ø Check whether the entered number is a prime number or

not

Ø Define a procedure to calculate x +y +z .

2

2

2

ØDefine a procedure to calculate x +y +z using lambda.

2

2

2

Ø Define a procedure to calculate x +(1+x) +x(1+x) using

2

2

2

lambda and let.





Programs – Lab4

Check the output for:

\1) (cons 3 4)

\2) (cons 3 (cons 4 5))

\3) (cons (cons 1 2) 6)

\4) (cons 8 (cons 5 (cons 7 nil)))

\5) (list 8 5 7)

\6) (cons (cons 5 6)(cons 2 3))

8/4/2020

DEPT. OF CSE

7





Programs – Lab4

\1) Write the statement using list and cons to produce the output 3

\1)

\2) ‘((1 . 2) (3 . 4))

\3) ‘((1.2) 3)

‘((1 . 2) 3 . 4)

\4) ‘( 1 (3) 4)

\5) ‘( 1 (3) . 4)

DEPT. OF CSE

8





List Lab programs

\1. Define a procedure to add all the elements of given list elements.

\2. Define a procedure to accept a list as it argument and return a list of square of elements.

\3. Define a procedure to return the element at corresponding position. [Assuming the first

content of the element in list is at 0th position]

\4. Define a procedure to reverse the elements of list.

8/4/2020

DEPT. OF CSE

9





List & Tree Lab programs-24/9/2021

\1. Define a procedure to return sum of odd elements from the given list

\2. Define a procedure to return a list of odd elements from the given list

\3. Define a procedure to search for an element from a given list

\1. Define a procedure to return sum of odd elements from the given tree

\2. Define a procedure to return a tree of odd elements from the given tree

\3. Define a procedure to search of an element from a given tree

\4. Define a procedure to reverse the elements of tree

\5. Define a procedure increment all elements of tree by 5. (without using map)

\6. Define a procedure increment all elements of tree by 5. (Using map)

8/4/2020

DEPT. OF CSE

10





Solution:

\1. Define a procedure to return a tree of odd elements from the given tree

#lang racket

(define (try pred li)

(cond ((null? li) null)

((pair? (car li))(fun li))

(else (if (pred (car li))

(cons (car li) (try pred (cdr li)))

(try pred (cdr li))))))

(define (fun tr)

(cond ((null? tr) null)

((pair? (car tr)) (cons (try odd? (car tr)) (fun (cdr tr))))

(else (if (odd? (car tr)) (cons (car tr)(fun (cdr tr))) (fun (cdr

tr))))))

(fun ‘(1 (2 3) 4))

(fun ‘(1 (2 (3)) 4))





Solution:

\1. Define a procedure to search of an element from a given tree

#lang racket

(define (proc ele tr)

(cond ((null? tr) "Not Present")

((not (pair? tr))(if(= ele tr) (begin (display "Element

Found") (exit))" "))

(else (proc ele (car tr))(proc ele (cdr tr)))))

(proc 2 '(1 (3) (4)))





Programs (1/10/2021 & 8/10/2021)

\1. Define a procedure to count the number of sub-trees. [Hint: to count the number of pair]

\2. Define a procedure to find product of even numbers from a range of numbers – without using

sequence of procedure concept

\3. Define a procedure to find product of even numbers from a range of numbers - using

sequence of procedure concept

\4. Define a procedure to find product of even numbers from a given tree – using sequence of

procedure concept

\5. Define a procedure to list all odd numbers after squaring the elements from a given range of

elements – using sequence of procedure concept

\6. Define a procedure to list all odd numbers after squaring the elements from a given tree –

using sequence of procedure concept





Programs (8/10/2021)

\1. Define a procedure to find product of cube of all elements in a given tree.

\2. Define a procedure to find product of cube of all elements in a given tree using sequence of

procedures.

\3. Define a procedure, to find Fibonacci for a range of elements and return a list of all odd

Fibonacci numbers.

\4. Define a procedure, to find Fibonacci for a range of elements and return a list of all odd

Fibonacci numbers using sequence of procedures.

\5. Define a procedure to increment all tree elements by 4 and return a list of even numbers

using sequence of procedures

\6. Define a procedure to increment all tree elements by 4 and return the sum of all odd

elements using sequence of procedures.

