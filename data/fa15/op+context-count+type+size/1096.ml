
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) *. 0.5
  | Times (a,b) -> (eval (a, x, y)) /. (eval (b, x, y))
  | Thresh (a,b,a_less,b_less) ->
      let x1 = eval (a, x, y) in
      let x2 = eval (b, x, y) in
      if x1 < x2 then eval (a_less, x, y) else ((eval b_less), x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) *. 0.5
  | Times (a,b) -> (eval (a, x, y)) /. (eval (b, x, y))
  | Thresh (a,b,a_less,b_less) ->
      let x1 = eval (a, x, y) in
      let x2 = eval (b, x, y) in
      if x1 < x2 then eval (a_less, x, y) else eval (b_less, x, y);;

*)

(* changed spans
(24,47)-(24,68)
(24,54)-(24,60)
*)

(* type error slice
(14,2)-(24,68)
(17,25)-(17,41)
(17,26)-(17,30)
(17,31)-(17,40)
(24,6)-(24,68)
(24,6)-(24,68)
(24,22)-(24,26)
(24,22)-(24,41)
(24,47)-(24,68)
(24,48)-(24,61)
(24,49)-(24,53)
(24,54)-(24,60)
*)
