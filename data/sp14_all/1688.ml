
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) / 2.0
  | Times (v,w) -> (eval (v, x, y)) * (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,22)-(15,66)
(eval (v , x , y) +. eval (w , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(16,20)-(16,55)
eval (v , x , y) *. eval (v , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)

(* type error slice
(13,15)-(13,18)
(13,15)-(13,35)
(13,19)-(13,35)
(13,20)-(13,24)
(15,22)-(15,60)
(15,22)-(15,66)
(15,63)-(15,66)
(16,20)-(16,36)
(16,20)-(16,55)
(16,21)-(16,25)
(16,39)-(16,55)
(16,40)-(16,44)
*)
