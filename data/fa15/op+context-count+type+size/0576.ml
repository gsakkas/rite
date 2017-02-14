
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) / 2) * (eval (e2, x, y))) / 3) *
         (eval (e3, x, y)))
        / 4
  | Creative e1 -> (-1) * (eval e1);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Uncreative (e1,e2,e3) ->
      (((((eval (e1, x, y)) /. 2.0) *. (eval (e2, x, y))) /. 3.0) *.
         (eval (e3, x, y)))
        /. 4.0
  | Creative e1 -> (-1.0) *. (eval (e1, x, y));;

*)

(* changed spans
(28,12)-(28,26)
(28,12)-(28,32)
(28,12)-(28,51)
(28,12)-(28,58)
(28,12)-(29,25)
(28,12)-(30,12)
(28,31)-(28,32)
(28,57)-(28,58)
(30,11)-(30,12)
(31,21)-(31,23)
(31,21)-(31,35)
(31,28)-(31,35)
(31,33)-(31,35)
*)

(* type error slice
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(28,12)-(28,16)
(28,12)-(28,26)
(28,12)-(28,32)
(28,12)-(28,51)
(28,12)-(29,25)
(28,37)-(28,41)
(28,37)-(28,51)
(29,11)-(29,15)
(29,11)-(29,25)
*)
