
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
(19,16)-(19,19)
(19,16)-(19,41)
(19,23)-(19,25)
(20,18)-(20,21)
(20,18)-(20,43)
(20,25)-(20,27)
(27,17)-(27,20)
(27,17)-(27,54)
(27,24)-(27,26)
*)

(* type error slice
(13,4)-(13,29)
(13,10)-(13,26)
(15,4)-(31,55)
(15,15)-(31,49)
(16,3)-(31,49)
(16,9)-(16,10)
(17,14)-(17,15)
(18,14)-(18,15)
(19,16)-(19,19)
(19,16)-(19,41)
(19,23)-(19,25)
(19,23)-(19,41)
(19,27)-(19,31)
(19,27)-(19,41)
(19,33)-(19,35)
(19,33)-(19,41)
(19,37)-(19,38)
(19,40)-(19,41)
(20,18)-(20,21)
(20,18)-(20,43)
(20,25)-(20,27)
(20,25)-(20,43)
(21,25)-(21,70)
(22,23)-(22,58)
(24,7)-(26,26)
(25,12)-(25,16)
(25,12)-(25,26)
(25,18)-(25,20)
(25,18)-(25,26)
(25,22)-(25,23)
(25,25)-(25,26)
(27,17)-(27,20)
(27,17)-(27,54)
(27,24)-(27,26)
(27,24)-(27,54)
(27,28)-(27,31)
(27,28)-(27,54)
(27,33)-(27,54)
(29,7)-(29,10)
(29,7)-(31,49)
(30,11)-(31,49)
*)
