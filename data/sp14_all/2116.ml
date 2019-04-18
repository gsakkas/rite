
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let c1 () = failwith "to be implemented";;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (eval (s1, x, y))
  | Cosine c1 -> cos (eval (c1, x, y))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let c1 () = (10, 13, 57);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (pi *. (eval (s1, x, y)))
  | Cosine c1 -> cos (pi *. (eval (c1, x, y)))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (h1,h2,h3,h4) ->
      if (eval (h1, x, y)) < (eval (h2, x, y))
      then eval (h3, x, y)
      else eval (h4, x, y);;

*)

(* changed spans
(11,13)-(11,41)
(10 , 13 , 57)
TupleG (fromList [LitG])

(14,3)-(19,69)
match e with
| VarX -> x +. 0.0
| VarY -> y +. 0.0
| Sine s1 -> sin (pi *. eval (s1 , x , y))
| Cosine c1 -> cos (pi *. eval (c1 , x , y))
| Average (a1 , a2) -> (eval (a1 , x , y) +. eval (a2 , x , y)) /. 2.0
| Times (t1 , t2) -> eval (t1 , x , y) *. eval (t2 , x , y)
| Thresh (h1 , h2 , h3 , h4) -> if eval (h1 , x , y) < eval (h2 , x , y)
                                then eval (h3 , x , y)
                                else eval (h4 , x , y)
CaseG (fromList [(ConPatG Nothing,Nothing,BopG EmptyG EmptyG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,IteG EmptyG EmptyG EmptyG)])

(17,20)-(17,37)
pi *. eval (s1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,22)-(18,39)
pi *. eval (c1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(19,68)-(19,69)
2.0
LitG

*)

(* type error slice
(19,24)-(19,69)
(19,68)-(19,69)
*)
