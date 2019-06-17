
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | Super of expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (v,w,q,r) ->
      if (eval (v, x, y)) < (eval (w, x, y))
      then eval (q, x, y)
      else eval (r, x, y)
  | Divide (v,w) -> (eval (v, x, y)) / (eval (w, x, y))
  | Super (v,w) -> ((eval (v, x, y)) + (eval (w, x, y))) * (eval (v, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Divide of expr* expr
  | Super of expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y))
  | Thresh (v,w,q,r) ->
      if (eval (v, x, y)) < (eval (w, x, y))
      then eval (q, x, y)
      else eval (r, x, y)
  | Divide (v,w) -> (eval (v, x, y)) /. (eval (w, x, y))
  | Super (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) *. (eval (v, x, y));;

*)

(* changed spans
(26,21)-(26,56)
eval (v , x , y) /. eval (w , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(27,20)-(27,76)
(eval (v , x , y) +. eval (w , x , y)) *. eval (v , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

*)

(* type error slice
(18,19)-(18,43)
(18,26)-(18,42)
(18,27)-(18,31)
(26,21)-(26,37)
(26,21)-(26,56)
(26,22)-(26,26)
(26,40)-(26,56)
(26,41)-(26,45)
(27,20)-(27,57)
(27,20)-(27,76)
(27,21)-(27,37)
(27,22)-(27,26)
(27,40)-(27,56)
(27,41)-(27,45)
(27,60)-(27,76)
(27,61)-(27,65)
*)
