
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval e1)) *. (asin (eval e2))) *. 2.0) /. (pi *. pi);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi);;

*)

(* changed spans
(27,21)-(27,23)
(27,30)-(27,43)
(27,41)-(27,43)
(27,50)-(27,53)
(27,59)-(27,61)
(27,65)-(27,67)
*)

(* type error slice
(15,3)-(27,67)
(15,3)-(27,67)
(18,28)-(18,32)
(18,28)-(18,42)
(18,34)-(18,42)
(27,16)-(27,20)
(27,16)-(27,23)
(27,21)-(27,23)
(27,36)-(27,40)
(27,36)-(27,43)
(27,41)-(27,43)
*)
