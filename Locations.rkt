#lang racket


(provide (struct-out location))
(provide timeline-root)

(struct location (name description branches songs) #:transparent)

(define timeline-root
  (location
   "root"
   "This is where each branch begins"
   (list "placeholder loc1" "placeholder loc2")
   (list "placeholder beacon-song")))
   