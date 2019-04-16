
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1 / (sin (pi *. (eval (e1, x, y))))) *
         (cos (pi *. (eval (e1, x, y)))))
        * (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1 / (sin (pi *. (eval (e1, x, y))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | NewOp1 (e1,e2,e3) ->
      ((1.0 /. (sin (pi *. (eval (e1, x, y))))) *.
         (cos (pi *. (eval (e1, x, y)))))
        *. (sin (pi *. (eval (e1, x, y))))
  | NewOp2 e1 -> 1.0 /. (sin (pi *. (eval (e1, x, y))));;

*)

(* changed spans
(28,7)-(30,42)
((1.0 /. sin (pi *. eval (e1 , x , y))) *. cos (pi *. eval (e1 , x , y))) *. sin (pi *. eval (e1 , x , y))
BopG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(31,18)-(31,53)
1.0 /. sin (pi *. eval (e1 , x , y))
BopG LitG (AppG (fromList [EmptyG]))

*)

(* type error slice
(16,3)-(31,53)
(19,16)-(19,19)
(19,16)-(19,45)
(28,7)-(29,42)
(28,7)-(30,42)
(28,8)-(28,45)
(28,13)-(28,44)
(28,14)-(28,17)
(29,10)-(29,41)
(29,11)-(29,14)
(30,11)-(30,42)
(30,12)-(30,15)
(31,18)-(31,53)
(31,22)-(31,53)
(31,23)-(31,26)
*)
