
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> pi * x
  | Cosine e -> pi * y
  | Average (e1,e2) -> buildAverage (e1, e2);;


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
  | Sine e -> pi *. x
  | Cosine e -> pi *. y
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y));;

*)

(* changed spans
(16,3)-(21,45)
match e with
| VarX -> x
| VarY -> y
| Sine e -> pi *. x
| Cosine e -> pi *. y
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (e1 , e2) -> eval (e1 , x , y) *. eval (e2 , x , y)
CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConPatG Nothing,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG),(ConPatG (Just EmptyPatG),Nothing,BopG EmptyG EmptyG)]

(19,15)-(19,21)
pi *. x
BopG VarG VarG

(20,17)-(20,23)
pi *. y
BopG VarG VarG

(21,24)-(21,45)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(13,4)-(13,29)
(13,10)-(13,27)
(16,3)-(21,45)
(17,14)-(17,15)
(19,15)-(19,17)
(19,15)-(19,21)
(19,20)-(19,21)
(20,17)-(20,19)
(20,17)-(20,23)
(21,24)-(21,36)
(21,24)-(21,45)
*)
