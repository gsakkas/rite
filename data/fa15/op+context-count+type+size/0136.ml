
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
      ((sin (pi * (eval (r, x, y)))) + (tan (pi * (eval (s, x, y))))) *
        (sin (pi * (eval (t, x, y))));;


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
      ((sin (pi *. (eval (r, x, y)))) +. (tan (pi *. (eval (s, x, y))))) *.
        (sin (pi *. (eval (t, x, y))));;

*)

(* changed spans
(27,9)-(27,33)
(27,9)-(27,65)
(27,9)-(28,34)
(27,14)-(27,33)
(27,46)-(27,65)
(28,15)-(28,34)
*)

(* type error slice
(12,4)-(12,29)
(12,10)-(12,26)
(18,20)-(18,40)
(18,27)-(18,31)
(18,27)-(18,40)
(27,9)-(27,12)
(27,9)-(27,33)
(27,14)-(27,16)
(27,14)-(27,33)
(27,14)-(27,33)
(27,14)-(27,33)
(27,20)-(27,24)
(27,20)-(27,33)
(27,41)-(27,44)
(27,41)-(27,65)
(27,46)-(27,65)
(27,46)-(27,65)
(27,52)-(27,56)
(27,52)-(27,65)
(28,10)-(28,13)
(28,10)-(28,34)
(28,15)-(28,34)
(28,15)-(28,34)
(28,21)-(28,25)
(28,21)-(28,34)
*)
