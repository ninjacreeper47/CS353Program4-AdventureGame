#lang racket

(require "Locations.rkt")

(define (hello-world)
  (println " Hello World"))

;real-life-time: int, timeline_location: function (representing the location),   song_inventory: hash-map  
(struct game-state (real-life-time timeline-location song-inventory ) #:transparent)


(define starting-state
  (game-state 0 "start" (list "change" "this" "later")))


(define (user-loop current-state )
   (game-state-real-life-time current-state))