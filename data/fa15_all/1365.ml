
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
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> "" ^ (sin (pi *. (eval (sine, x, y))))
  | Cosine cos -> "cos(pi*" ^ ((eval (cos, x, y)) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((eval (e1, x, y)) ^ ("+" ^ ((eval (e2, x, y)) ^ ")/2)")))
  | Times (t1,t2) -> (eval (t1, x, y)) ^ ("*" ^ (eval (t2, x, y)))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((eval (th1, x, y)) ^
           ("<*" ^
              ((eval (th2, x, y)) ^
                 ("?" ^
                    ((eval (th3, x, y)) ^ (":" ^ ((eval (th4, x, y)) ^ ")")))))));;


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
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y);;

*)

(* changed spans
(14,2)-(28,81)
match e with
| VarX -> x
| VarY -> y
| Sine sine -> sin (pi *. eval (sine , x , y))
| Cosine cosine -> cos (pi *. eval (cosine , x , y))
| Average (e1 , e2) -> (eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
| Times (t1 , t2) -> eval (t1 , x , y) *. eval (t2 , x , y)
| Thresh (th1 , th2 , th3 , th4) -> if eval (th1 , x , y) < eval (th2 , x , y)
                                    then eval (th3 , x , y)
                                    else eval (th4 , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG)])

(18,32)-(18,36)
cos
VarG

(18,32)-(18,36)
pi
VarG

(18,32)-(18,36)
eval (cosine , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(18,32)-(18,36)
pi *. eval (cosine , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(18,38)-(18,41)
cosine
VarG

(20,14)-(20,31)
eval (e1 , x , y) +. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(20,32)-(20,33)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(21,21)-(21,38)
eval (t1 , x , y) *. eval (t2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(21,39)-(21,40)
2.0
LitG

(24,9)-(24,27)
eval (th1 , x , y) < eval (th2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(24,28)-(24,29)
if eval (th1 , x , y) < eval (th2 , x , y)
then eval (th3 , x , y)
else eval (th4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)
