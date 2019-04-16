
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
(24,48)-(24,69)
eval (b_less , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(14,3)-(24,69)
(17,26)-(17,42)
(17,27)-(17,31)
(17,32)-(17,41)
(24,7)-(24,69)
(24,23)-(24,27)
(24,23)-(24,42)
(24,48)-(24,69)
(24,49)-(24,62)
(24,50)-(24,54)
(24,55)-(24,61)
*)
