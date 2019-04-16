
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
  | Thresh (w,x,y,z) -> if (eval w) < (eval x) then eval y else eval z
  | Times (x,y) -> (eval x) * (eval y)
  | Average (x,y) -> ((eval x) * (eval y)) / 2
  | Cosine x -> cos (pi * (eval x))
  | Sine x -> sin (pi * (eval x))
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
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) *. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(14,3)-(21,15)
match e with
| Thresh (w , t , u , z) -> if eval (w , x , y) < eval (t , x , y)
                            then eval (u , x , y)
                            else eval (z , x , y)
| Times (t , u) -> eval (t , x , y) *. eval (u , x , y)
| Average (t , u) -> (eval (t , x , y) *. eval (u , x , y)) /. 2.0
| Cosine t -> cos (pi *. eval (t , x , y))
| Sine t -> sin (pi *. eval (t , x , y))
| VarX -> x
| VarY -> y
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,27)
(13,4)-(21,17)
(13,15)-(21,15)
(14,3)-(21,15)
(15,28)-(15,36)
(15,29)-(15,33)
(15,34)-(15,35)
(18,17)-(18,20)
(18,17)-(18,36)
(18,21)-(18,36)
(18,22)-(18,24)
(19,15)-(19,18)
(19,15)-(19,34)
(19,19)-(19,34)
(19,20)-(19,22)
*)
