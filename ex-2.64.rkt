#lang racket

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let* ((left-size      (quotient (- n 1) 2))
             (left-result    (partial-tree elts left-size))
             (left-tree      (car left-result))
             (non-left-elts  (cdr left-result))
             (right-size     (- n (+ left-size 1)))
             (this-entry     (car non-left-elts))
             (right-result   (partial-tree (cdr non-left-elts) right-size))
             (right-tree     (car right-result))
             (remaining-elts (cdr right-result)))
        (cons (make-tree this-entry left-tree right-tree)
              remaining-elts))))


(list->tree '(1 3 5 7 9 11))
