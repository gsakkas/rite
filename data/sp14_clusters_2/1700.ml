
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) * 2)
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin ((eval (a, x, y)) *. pi)
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

*)

(* changed spans
(13,14)-(21,25)
atan
VarG

(13,14)-(21,25)
atan 1.0
AppG (fromList [LitG])

(13,14)-(21,25)
4.0 *. atan 1.0
BopG LitG (AppG (fromList [EmptyG]))

(13,14)-(21,25)
4.0
LitG

(13,14)-(21,25)
1.0
LitG

(17,18)-(17,40)
eval (a , x , y) *. pi
BopG (AppG (fromList [EmptyG])) VarG

(17,38)-(17,39)
pi
VarG

*)
