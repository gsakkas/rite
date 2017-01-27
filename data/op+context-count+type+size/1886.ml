
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
      let result = eval a in if result = 0. then 0 else 1 /. result
  | Max (a,b) ->
      let aResult = eval a in
      let bResult = eval b in if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval a in
      let bResult = eval b in
      let cResult = eval c in
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
(29,25)-(29,26)
(29,30)-(29,68)
(29,50)-(29,51)
(29,57)-(29,58)
(31,26)-(31,27)
(32,7)-(32,77)
(32,26)-(32,27)
(32,31)-(32,77)
(34,26)-(34,27)
(35,7)-(39,58)
(35,26)-(35,27)
(36,7)-(39,58)
(36,21)-(36,25)
(36,21)-(36,27)
(36,26)-(36,27)
(37,7)-(39,58)
(37,10)-(37,17)
(37,10)-(37,27)
(37,20)-(37,27)
(38,12)-(38,19)
(39,12)-(39,58)
(39,15)-(39,22)
(39,15)-(39,32)
(39,25)-(39,32)
(39,38)-(39,45)
(39,51)-(39,58)
*)

(* type error slice
(17,3)-(39,58)
(18,14)-(18,15)
(20,27)-(20,31)
(20,27)-(20,40)
(20,33)-(20,34)
(20,33)-(20,40)
(20,36)-(20,37)
(20,39)-(20,40)
(29,7)-(29,68)
(29,20)-(29,24)
(29,20)-(29,26)
(29,25)-(29,26)
(29,30)-(29,68)
(29,50)-(29,51)
(29,57)-(29,58)
(29,57)-(29,68)
(31,21)-(31,25)
(31,21)-(31,27)
(31,26)-(31,27)
(32,21)-(32,25)
(32,21)-(32,27)
(32,26)-(32,27)
(34,21)-(34,25)
(34,21)-(34,27)
(34,26)-(34,27)
(35,21)-(35,25)
(35,21)-(35,27)
(35,26)-(35,27)
(36,21)-(36,25)
(36,21)-(36,27)
(36,26)-(36,27)
*)
