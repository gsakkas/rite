
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
(26,22)-(26,54)
(27,22)-(27,35)
(27,22)-(27,54)
(27,22)-(27,74)
*)

(* type error slice
(18,20)-(18,40)
(18,27)-(18,31)
(18,27)-(18,40)
(26,22)-(26,26)
(26,22)-(26,35)
(26,22)-(26,54)
(26,22)-(26,54)
(26,41)-(26,45)
(26,41)-(26,54)
(27,22)-(27,26)
(27,22)-(27,35)
(27,22)-(27,54)
(27,22)-(27,54)
(27,22)-(27,74)
(27,41)-(27,45)
(27,41)-(27,54)
(27,61)-(27,65)
(27,61)-(27,74)
*)
