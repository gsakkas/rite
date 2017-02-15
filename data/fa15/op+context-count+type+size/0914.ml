
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
(27,39)-(27,40)
(27,46)-(27,47)
(27,46)-(27,66)
(27,50)-(27,66)
(27,72)-(27,73)
(27,72)-(27,77)
(27,76)-(27,77)
(29,6)-(31,19)
(29,9)-(29,70)
(29,10)-(29,49)
(29,11)-(29,28)
(29,73)-(29,74)
(30,11)-(30,12)
(30,11)-(30,76)
(30,15)-(30,76)
(30,16)-(30,55)
(30,17)-(30,34)
(31,11)-(31,15)
(31,11)-(31,19)
(31,18)-(31,19)
*)

(* type error slice
(19,19)-(19,44)
(19,26)-(19,43)
(19,27)-(19,31)
(27,20)-(27,36)
(27,20)-(27,40)
(27,20)-(27,40)
(27,21)-(27,25)
(27,39)-(27,40)
(27,46)-(27,66)
(27,50)-(27,66)
(27,51)-(27,55)
(29,10)-(29,49)
(29,10)-(29,49)
(29,11)-(29,28)
(29,12)-(29,16)
(29,31)-(29,48)
(29,32)-(29,36)
(30,16)-(30,55)
(30,16)-(30,55)
(30,17)-(30,34)
(30,18)-(30,22)
(30,37)-(30,54)
(30,38)-(30,42)
*)
