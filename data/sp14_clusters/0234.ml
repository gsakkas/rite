
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval a in if result = 0. then 0 else 1 /. result
  | Max (a,b) ->
      let aResult = eval a in
      let bResult = eval b in if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval a in
      let bResult = eval b in
      let cResult = eval c in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Inverse of expr
  | Max of expr* expr
  | Range of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine a -> cos (pi *. (eval (a, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Inverse a ->
      let result = eval (a, x, y) in if result = 0. then 0. else 1. /. result
  | Max (a,b) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      if aResult > bResult then aResult else bResult
  | Range (a,b,c) ->
      let aResult = eval (a, x, y) in
      let bResult = eval (b, x, y) in
      let cResult = eval (c, x, y) in
      if aResult < bResult
      then bResult
      else if aResult < cResult then cResult else aResult;;

*)

(* changed spans
(29,24)-(29,25)
(a , x , y)
TupleG [VarG,VarG,VarG]

(29,29)-(29,67)
x
VarG

(29,29)-(29,67)
y
VarG

(29,49)-(29,50)
0.0
LitG

(29,56)-(29,57)
1.0
LitG

(31,25)-(31,26)
(a , x , y)
TupleG [VarG,VarG,VarG]

(32,6)-(32,76)
x
VarG

(32,6)-(32,76)
y
VarG

(32,25)-(32,26)
(b , x , y)
TupleG [VarG,VarG,VarG]

(32,30)-(32,76)
x
VarG

(32,30)-(32,76)
y
VarG

(34,25)-(34,26)
(a , x , y)
TupleG [VarG,VarG,VarG]

(35,6)-(39,57)
x
VarG

(35,6)-(39,57)
y
VarG

(35,25)-(35,26)
(b , x , y)
TupleG [VarG,VarG,VarG]

(36,6)-(39,57)
x
VarG

(36,6)-(39,57)
y
VarG

(36,25)-(36,26)
(c , x , y)
TupleG [VarG,VarG,VarG]

(37,6)-(39,57)
x
VarG

(37,6)-(39,57)
y
VarG

*)
