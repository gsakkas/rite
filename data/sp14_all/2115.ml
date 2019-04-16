
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
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) / 2.0;;


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

(14,3)-(19,70)
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
CaseG VarG (fromList [(ConPatG Nothing,Nothing,BopG EmptyG EmptyG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(14,3)-(19,70)
(15,14)-(15,22)
(19,24)-(19,64)
(19,24)-(19,70)
(19,67)-(19,70)
*)
