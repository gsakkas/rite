
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Plus (v,w) -> (eval (v, x, y)) +. (eval (w, x, y))
  | Cube (a,b,c) -> ((eval a) *. (eval b)) *. (eval c)
  | VarX  -> x
  | VarY  -> y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Plus (v,w) -> (eval (v, x, y)) +. (eval (w, x, y))
  | Cube (a,b,c) ->
      ((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(26,28)-(26,29)
(a , x , y)
TupleG [VarG,VarG,VarG]

(26,40)-(26,41)
(b , x , y)
TupleG [VarG,VarG,VarG]

(26,53)-(26,54)
(c , x , y)
TupleG [VarG,VarG,VarG]

*)

(* type error slice
(16,3)-(28,15)
(17,26)-(17,42)
(17,27)-(17,31)
(17,32)-(17,41)
(26,22)-(26,30)
(26,23)-(26,27)
(26,28)-(26,29)
(26,34)-(26,42)
(26,35)-(26,39)
(26,40)-(26,41)
(26,47)-(26,55)
(26,48)-(26,52)
(26,53)-(26,54)
*)
