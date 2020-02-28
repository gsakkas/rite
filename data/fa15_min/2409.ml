
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
  | Average (e,f) -> ((eval (e, x, y)) +. (eval (f, x, y))) / 2.0
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
(17,22)-(17,66)
(eval (e , x , y) +. eval (f , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(18,20)-(18,55)
eval (e , x , y) *. eval (f , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

*)

(* type error slice
(15,15)-(15,18)
(15,15)-(15,35)
(15,19)-(15,35)
(15,20)-(15,24)
(17,22)-(17,60)
(17,22)-(17,66)
(17,63)-(17,66)
(18,20)-(18,36)
(18,20)-(18,55)
(18,21)-(18,25)
(18,39)-(18,55)
(18,40)-(18,44)
*)
