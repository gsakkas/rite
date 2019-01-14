
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
eval (v , x , y) /. eval (w , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(27,19)-(27,56)
(eval (v , x , y) +. eval (w , x , y)) *. eval (v , x , y)
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(27,20)-(27,36)
eval (v , x , y) +. eval (w , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)
