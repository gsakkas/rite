
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
(27,17)-(27,20)
(27,17)-(27,54)
(27,24)-(27,26)
*)

(* type error slice
(13,4)-(13,29)
(13,10)-(13,26)
(16,3)-(31,49)
(16,3)-(31,49)
(19,16)-(19,19)
(19,16)-(19,42)
(27,17)-(27,20)
(27,17)-(27,54)
(27,17)-(27,54)
(27,24)-(27,26)
(27,24)-(27,54)
*)
