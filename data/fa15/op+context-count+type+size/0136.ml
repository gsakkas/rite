
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
(27,6)-(27,69)
(27,6)-(28,37)
(27,7)-(27,36)
(27,12)-(27,35)
(27,44)-(27,67)
(28,13)-(28,36)
*)

(* type error slice
(12,3)-(12,28)
(12,9)-(12,26)
(18,18)-(18,42)
(18,25)-(18,41)
(18,26)-(18,30)
(27,7)-(27,36)
(27,8)-(27,11)
(27,12)-(27,35)
(27,12)-(27,35)
(27,12)-(27,35)
(27,13)-(27,15)
(27,18)-(27,34)
(27,19)-(27,23)
(27,39)-(27,68)
(27,40)-(27,43)
(27,44)-(27,67)
(27,44)-(27,67)
(27,50)-(27,66)
(27,51)-(27,55)
(28,8)-(28,37)
(28,9)-(28,12)
(28,13)-(28,36)
(28,13)-(28,36)
(28,19)-(28,35)
(28,20)-(28,24)
*)
