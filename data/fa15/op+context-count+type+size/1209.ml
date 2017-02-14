
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
      if x1 < x2 then ((eval a_less), x, y) else ((eval b_less), x, y);;


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
(24,25)-(24,43)
(24,30)-(24,36)
(24,52)-(24,70)
(24,57)-(24,63)
*)

(* type error slice
(14,3)-(24,70)
(14,3)-(24,70)
(14,3)-(24,70)
(14,3)-(24,70)
(17,15)-(17,18)
(17,15)-(17,40)
(17,27)-(17,31)
(17,27)-(17,40)
(17,33)-(17,40)
(22,7)-(24,70)
(23,7)-(24,70)
(24,7)-(24,70)
(24,25)-(24,29)
(24,25)-(24,36)
(24,25)-(24,43)
(24,30)-(24,36)
(24,52)-(24,56)
(24,52)-(24,63)
(24,57)-(24,63)
*)
