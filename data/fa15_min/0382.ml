
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((eval (t, x, y)) mod 30.0) +. ((eval (r, x, y)) mod (eval (s, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Trip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y)
  | Trip (t,r,s) ->
      ((eval (t, x, y)) /. 30.0) +. ((eval (r, x, y)) /. (eval (s, x, y)));;

*)

(* changed spans
(27,7)-(27,34)
eval (t , x , y) /. 30.0
BopG (AppG [EmptyG]) LitG

(27,38)-(27,77)
eval (r , x , y) /. eval (s , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

*)

(* type error slice
(18,19)-(18,43)
(18,26)-(18,42)
(18,27)-(18,31)
(27,7)-(27,34)
(27,7)-(27,77)
(27,8)-(27,24)
(27,9)-(27,13)
(27,29)-(27,33)
(27,38)-(27,77)
(27,39)-(27,55)
(27,40)-(27,44)
(27,60)-(27,76)
(27,61)-(27,65)
*)
