
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
(27,16)-(27,19)
(27,16)-(27,58)
(27,23)-(27,25)
*)

(* type error slice
(13,3)-(13,28)
(13,9)-(13,26)
(16,2)-(31,52)
(16,2)-(31,52)
(19,15)-(19,18)
(19,15)-(19,44)
(27,16)-(27,19)
(27,16)-(27,58)
(27,16)-(27,58)
(27,22)-(27,58)
(27,23)-(27,25)
*)
