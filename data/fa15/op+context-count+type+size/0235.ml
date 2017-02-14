
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
  | Sine e -> sin (eval e)
  | Cosine e -> cos (eval e)
  | Average (e,f) -> ((eval e) + (eval f)) / 2
  | Times (e,f) -> (eval e) * (eval f)
  | Thresh (e,f,g,h) ->
      (match (eval e) < (eval f) with | true  -> eval g | false  -> eval h);;


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
(15,24)-(15,25)
(16,16)-(16,28)
(16,26)-(16,27)
(17,21)-(17,42)
(17,21)-(17,46)
(17,22)-(17,30)
(17,28)-(17,29)
(17,33)-(17,41)
(17,39)-(17,40)
(17,45)-(17,46)
(18,19)-(18,27)
(18,19)-(18,38)
(18,25)-(18,26)
(18,30)-(18,38)
(18,36)-(18,37)
(20,13)-(20,21)
(20,13)-(20,32)
(20,14)-(20,18)
(20,19)-(20,20)
(20,24)-(20,32)
(20,25)-(20,29)
(20,30)-(20,31)
(20,49)-(20,53)
(20,49)-(20,55)
(20,54)-(20,55)
(20,68)-(20,72)
(20,68)-(20,74)
(20,73)-(20,74)
*)

(* type error slice
(11,3)-(20,77)
(11,14)-(20,75)
(12,2)-(20,75)
(12,2)-(20,75)
(12,2)-(20,75)
(12,2)-(20,75)
(15,14)-(15,17)
(15,14)-(15,26)
(15,18)-(15,26)
(15,19)-(15,23)
(15,24)-(15,25)
(17,21)-(17,42)
(17,21)-(17,42)
(17,21)-(17,46)
(17,22)-(17,30)
(17,23)-(17,27)
(17,33)-(17,41)
(17,34)-(17,38)
(18,19)-(18,27)
(18,19)-(18,38)
(18,19)-(18,38)
(18,19)-(18,38)
(18,20)-(18,24)
(18,30)-(18,38)
(18,31)-(18,35)
*)
