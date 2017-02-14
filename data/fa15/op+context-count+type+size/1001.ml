
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | OneOver e -> if (eval (e, x, y)) > 1 then 1 / (eval (e, x, y)) else 1 / 3
  | OneOverAvg (e1,e2,e3) ->
      if (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y))) > 1
      then 1 / (((eval (e1, x, y)) + (eval (e2, x, y))) + (eval (e3, x, y)))
      else (-1) / 3;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | OneOver of expr
  | OneOverAvg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | OneOver e ->
      if (eval (e, x, y)) > 1.0 then 1.0 /. (eval (e, x, y)) else 1.0 /. 3.0
  | OneOverAvg (e1,e2,e3) ->
      if
        (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y))) > 1.0
      then
        1.0 /.
          (((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y)))
      else (-1.0) /. 3.0;;

*)

(* changed spans
(27,40)-(27,41)
(27,47)-(27,48)
(27,47)-(27,65)
(27,52)-(27,65)
(27,73)-(27,74)
(27,73)-(27,78)
(27,77)-(27,78)
(29,7)-(31,20)
(29,13)-(29,27)
(29,13)-(29,47)
(29,13)-(29,68)
(29,74)-(29,75)
(30,12)-(30,13)
(30,12)-(30,74)
(30,19)-(30,33)
(30,19)-(30,53)
(30,19)-(30,74)
(31,13)-(31,15)
(31,13)-(31,20)
(31,19)-(31,20)
*)

(* type error slice
(19,21)-(19,42)
(19,28)-(19,32)
(19,28)-(19,42)
(27,22)-(27,26)
(27,22)-(27,35)
(27,22)-(27,41)
(27,22)-(27,41)
(27,40)-(27,41)
(27,47)-(27,65)
(27,52)-(27,56)
(27,52)-(27,65)
(29,13)-(29,17)
(29,13)-(29,27)
(29,13)-(29,47)
(29,13)-(29,47)
(29,13)-(29,68)
(29,33)-(29,37)
(29,33)-(29,47)
(29,54)-(29,58)
(29,54)-(29,68)
(30,19)-(30,23)
(30,19)-(30,33)
(30,19)-(30,53)
(30,19)-(30,53)
(30,19)-(30,74)
(30,39)-(30,43)
(30,39)-(30,53)
(30,60)-(30,64)
(30,60)-(30,74)
*)
