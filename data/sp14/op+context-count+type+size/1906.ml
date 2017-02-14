
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval (a, x, y) in if result = 0. then 0 else 1 /. result
  | Max (a,b) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      let cResult = eval (c, x, y) in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval (a, x, y) in if result = 0. then 0. else 1. /. result
  | Max (a,b) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      let cResult = eval (c, x, y) in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;

*)

(* changed spans
(29,57)-(29,58)
(29,64)-(29,65)
*)

(* type error slice
(17,2)-(40,57)
(17,2)-(40,57)
(20,14)-(20,17)
(20,14)-(20,42)
(29,6)-(29,75)
(29,37)-(29,75)
(29,37)-(29,75)
(29,57)-(29,58)
(29,64)-(29,65)
(29,64)-(29,75)
(29,64)-(29,75)
*)
