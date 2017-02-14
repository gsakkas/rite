
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
  | Sine b -> sin (pi * (eval (b, x, y)))
  | Cosine b -> cos (pi * (eval (b, x, y)))
  | Average (a,b) -> (eval (a, x, y)) + ((eval (b, x, y)) / 2)
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | _ -> 0;;


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
  | Sine b -> sin (pi *. (eval (b, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (a,b) -> (eval (a, x, y)) +. ((eval (b, x, y)) /. 2.0)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | _ -> 0.0;;

*)

(* changed spans
(17,18)-(17,41)
(18,20)-(18,43)
(19,21)-(19,62)
(19,40)-(19,62)
(19,60)-(19,61)
(20,19)-(20,35)
(20,19)-(20,54)
(25,9)-(25,10)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(17,14)-(17,17)
(17,14)-(17,41)
(17,18)-(17,41)
(17,18)-(17,41)
(17,19)-(17,21)
(18,16)-(18,19)
(18,16)-(18,43)
(18,20)-(18,43)
(18,20)-(18,43)
(18,21)-(18,23)
*)
