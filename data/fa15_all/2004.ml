
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) -> (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      (sqrt
         (abs (((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y)))))
        /. 3.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine n -> sin (pi *. (eval (n, x, y)))
  | Cosine n -> cos (pi *. (eval (n, x, y)))
  | Average (m,n) -> ((eval (m, x, y)) +. (eval (n, x, y))) /. 2.0
  | Times (m,n) -> (eval (m, x, y)) *. (eval (n, x, y))
  | Thresh (m,n,o,p) ->
      if (eval (m, x, y)) < (eval (n, x, y))
      then eval (o, x, y)
      else eval (p, x, y)
  | Power (m,n) -> (eval (m, x, y)) ** (eval (n, x, y))
  | Op (m,n,o) ->
      let d = ((eval (m, x, y)) +. (eval (n, x, y))) +. (eval (o, x, y)) in
      (sqrt (d ** d)) /. 3.0;;

*)

(* changed spans
(30,10)-(30,13)
let d =
  (eval (m , x , y) +. eval (n , x , y)) +. eval (o , x , y) in
sqrt (d ** d) /. 3.0
LetG NonRec (fromList [BopG EmptyG EmptyG]) (BopG EmptyG EmptyG)

(31,11)-(31,14)
sqrt
VarG

(31,11)-(31,14)
d
VarG

(31,11)-(31,14)
(**)
VarG

(31,11)-(31,14)
d
VarG

(31,11)-(31,14)
sqrt (d ** d)
AppG (fromList [AppG (fromList [EmptyG])])

(31,11)-(31,14)
d ** d
AppG (fromList [VarG])

(31,11)-(31,14)
sqrt (d ** d) /. 3.0
BopG (AppG (fromList [EmptyG])) LitG

*)
