#lang racket

(require "GameStateElevatedWorld.rkt")



(provide timeline-root test-duck)
;locations
(define timeline-root
  (location
   "root"
   "This is where each branch begins"
   (list "placeholder loc1" "placeholder loc2")
   (list "placeholder beacon-song")))

;items

(define test-duck
  (item "duck" "it quacks" (lambda (x) (displayln "quack!"))))