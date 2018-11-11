
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
(11,12)-(11,40)
4.0 *. atan 1.0
BopG LitG (AppG [EmptyG])

(11,12)-(11,40)
10
LitG

(11,12)-(11,40)
13
LitG

(11,12)-(11,40)
57
LitG

(11,12)-(11,40)
4.0
LitG

(11,12)-(11,40)
(10 , 13 , 57)
TupleG [LitG,LitG,LitG]

(11,21)-(11,40)
atan
VarG

(13,14)-(19,68)
1.0
LitG

(14,2)-(19,68)
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
CaseG VarG [(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,BopG EmptyG EmptyG),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)]

(17,19)-(17,36)
pi
VarG

(17,19)-(17,36)
pi *. eval (s1 , x , y)
BopG VarG (AppG [EmptyG])

(18,21)-(18,38)
pi
VarG

(18,21)-(18,38)
pi *. eval (c1 , x , y)
BopG VarG (AppG [EmptyG])

(19,67)-(19,68)
2.0
LitG

*)
