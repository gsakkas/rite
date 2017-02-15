
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
(26,20)-(26,55)
(27,19)-(27,56)
(27,19)-(27,75)
(27,20)-(27,36)
*)

(* type error slice
(18,18)-(18,42)
(18,25)-(18,41)
(18,26)-(18,30)
(26,20)-(26,36)
(26,20)-(26,55)
(26,20)-(26,55)
(26,21)-(26,25)
(26,39)-(26,55)
(26,40)-(26,44)
(27,19)-(27,56)
(27,19)-(27,56)
(27,19)-(27,75)
(27,20)-(27,36)
(27,21)-(27,25)
(27,39)-(27,55)
(27,40)-(27,44)
(27,59)-(27,75)
(27,60)-(27,64)
*)
