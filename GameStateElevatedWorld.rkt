#lang racket

(provide (struct-out location))
(provide (struct-out item))
(provide (struct-out game-state))

(provide use)
(provide move-to)
(provide list-inventory)
(provide where-am-i???)

(struct location (name description branches items) #:transparent)
(struct item (name description effect) #:transparent)
(struct game-state (time-left my-location  inventory world-map ) #:transparent)

;syntatic sugar for calling the effect function in an item
(define (use this-item state)
  ((item-effect this-item) state))

(define (move-to new-location state)
  (struct-copy game-state state [my-location new-location]))

(define (list-inventory state)
  (begin
    (displayln "Inventory:")
    (for ([i (game-state-inventory state)])
      (displayln i))
    state))


(define (where-am-i??? state)
  (begin
    (displayln (string-append "You are in the " (game-state-my-location state)))
    state))