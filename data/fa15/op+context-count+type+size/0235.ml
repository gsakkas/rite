
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
(15,25)-(15,26)
(16,17)-(16,28)
(16,27)-(16,28)
(17,24)-(17,30)
(17,24)-(17,41)
(17,24)-(17,47)
(17,29)-(17,30)
(17,35)-(17,41)
(17,40)-(17,41)
(17,46)-(17,47)
(18,21)-(18,27)
(18,21)-(18,38)
(18,26)-(18,27)
(18,32)-(18,38)
(18,37)-(18,38)
(20,15)-(20,19)
(20,15)-(20,21)
(20,15)-(20,32)
(20,20)-(20,21)
(20,26)-(20,30)
(20,26)-(20,32)
(20,31)-(20,32)
(20,50)-(20,54)
(20,50)-(20,56)
(20,55)-(20,56)
(20,69)-(20,73)
(20,69)-(20,75)
(20,74)-(20,75)
*)

(* type error slice
(11,4)-(20,78)
(11,15)-(20,75)
(12,3)-(20,75)
(12,3)-(20,75)
(12,3)-(20,75)
(12,3)-(20,75)
(15,15)-(15,18)
(15,15)-(15,26)
(15,20)-(15,24)
(15,20)-(15,26)
(15,25)-(15,26)
(17,24)-(17,28)
(17,24)-(17,30)
(17,24)-(17,41)
(17,24)-(17,41)
(17,24)-(17,47)
(17,35)-(17,39)
(17,35)-(17,41)
(18,21)-(18,25)
(18,21)-(18,27)
(18,21)-(18,38)
(18,21)-(18,38)
(18,21)-(18,38)
(18,32)-(18,36)
(18,32)-(18,38)
*)
