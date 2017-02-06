
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let buildX () = VarX;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval ((buildX ()), a, y))
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

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval (a, x, y))
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

*)

(* changed spans
(13,12)-(13,21)
(13,17)-(13,21)
(19,27)-(19,33)
(19,27)-(19,36)
(19,34)-(19,36)
(19,42)-(19,43)
*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(13,12)-(13,21)
(13,17)-(13,21)
(15,4)-(23,28)
(15,15)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,3)-(23,26)
(16,9)-(16,10)
(17,14)-(17,15)
(18,14)-(18,15)
(19,15)-(19,18)
(19,15)-(19,43)
(19,15)-(19,43)
(19,20)-(19,24)
(19,20)-(19,43)
(19,20)-(19,43)
(19,27)-(19,33)
(19,27)-(19,36)
(19,27)-(19,43)
(19,34)-(19,36)
(19,39)-(19,40)
(19,42)-(19,43)
(20,17)-(20,18)
(21,22)-(21,23)
(22,20)-(22,21)
(23,25)-(23,26)
*)
