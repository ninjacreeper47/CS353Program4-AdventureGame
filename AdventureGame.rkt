#lang racket

(require "GameStateElevatedWorld.rkt")
(require "LocationsAndItems.rkt")





(define starting-state
  (game-state 100 timeline-root (list "change" "this" "later") "TODO: world map"))


(define (user-loop state )
  (if (positive? (game-state-time-left state))
   (user-loop (prompt-user state))
   ("You awaken from the dream [END OF GAME")))

(define (prompt-user state)
  (let ([input (read-line)])
    (let ([action (first(string-split input))]
          [target (second(string-split input))])
      (cond
        [(equal? action "help") (help-action state)]
        [(equal? action "move") (move-action state target)]
        [(equal? action "search" (search-action state (game-state-my-location state)))]
        [equal? action "use"] (use-action state target)
        [else (invalid-action current-state)]))))

(define (help-action state)
  (begin
    (where-am-i??? state)
    (list-inventory state)
    (displayln "Available commands:  help; search; move <direction>; use <item-name>; gather <item-name>;  drop <item-name>")
    state))