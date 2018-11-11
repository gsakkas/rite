
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
(26,27)-(26,28)
(a , x , y)
TupleG [VarG,VarG,VarG]

(26,33)-(26,41)
x
VarG

(26,33)-(26,41)
y
VarG

(26,39)-(26,40)
(b , x , y)
TupleG [VarG,VarG,VarG]

(26,46)-(26,54)
x
VarG

(26,46)-(26,54)
y
VarG

(26,52)-(26,53)
(c , x , y)
TupleG [VarG,VarG,VarG]

*)
