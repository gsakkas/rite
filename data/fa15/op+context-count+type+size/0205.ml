
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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e,f) -> ((eval (e, x, y)) +. (eval (f, x, y))) /. 2.0
  | Times (e,f) -> (eval (e, x, y)) * (eval (f, x, y))
  | Thresh (e,f,g,h) ->
      (match (eval (e, x, y)) < (eval (f, x, y)) with
       | true  -> eval (g, x, y)
       | false  -> eval (h, x, y));;


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
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (eval (e, x, y))
  | Cosine e -> cos (eval (e, x, y))
  | Average (e,f) -> ((eval (e, x, y)) +. (eval (f, x, y))) /. 2.0
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (e,f,g,h) ->
      (match (eval (e, x, y)) < (eval (f, x, y)) with
       | true  -> eval (g, x, y)
       | false  -> eval (h, x, y));;

*)

(* changed spans
(18,19)-(18,54)
*)

(* type error slice
(15,14)-(15,17)
(15,14)-(15,34)
(15,18)-(15,34)
(15,19)-(15,23)
(18,19)-(18,35)
(18,19)-(18,54)
(18,19)-(18,54)
(18,20)-(18,24)
(18,38)-(18,54)
(18,39)-(18,43)
*)
