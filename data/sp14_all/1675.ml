
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin * (pi (eval (e1, x, y)))
  | Cosine e1 -> cos * (pi (eval (e1, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Magic e1 -> sin * (pi (cos (pi *. (eval (e1, x, y)))))
  | Weird (e1,e2,e3) ->
      cos
        ((pi *. (eval (e1, x, y))) *.
           ((eval (e2, x, y)) *. (eval (e3, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Magic of expr
  | Weird of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) /. 2.0)
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Magic e1 -> sin (pi *. (cos (pi *. (eval (e1, x, y)))))
  | Weird (e1,e2,e3) ->
      cos
        ((pi *. (eval (e1, x, y))) *.
           ((eval (e2, x, y)) *. (eval (e3, x, y))));;

*)

(* changed spans
(19,16)-(19,44)
sin (pi *. eval (e1 , x , y))
AppG [BopG EmptyG EmptyG]

(20,18)-(20,46)
cos (pi *. eval (e1 , x , y))
AppG [BopG EmptyG EmptyG]

(27,17)-(27,59)
sin (pi *. cos (pi *. eval (e1 , x , y)))
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(13,4)-(13,29)
(13,10)-(13,27)
(15,4)-(31,55)
(15,15)-(31,53)
(16,3)-(31,53)
(19,16)-(19,19)
(19,16)-(19,44)
(19,22)-(19,44)
(19,23)-(19,25)
(20,18)-(20,21)
(20,18)-(20,46)
(20,24)-(20,46)
(20,25)-(20,27)
(21,24)-(21,71)
(21,45)-(21,71)
(21,46)-(21,63)
(21,47)-(21,51)
(22,22)-(22,60)
(24,7)-(26,27)
(26,12)-(26,16)
(26,12)-(26,27)
(27,17)-(27,20)
(27,17)-(27,59)
(27,23)-(27,59)
(27,24)-(27,26)
(29,7)-(29,10)
(29,7)-(31,53)
*)
