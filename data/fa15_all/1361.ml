
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (eval sine)
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
(12,3)-(26,82)
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
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(11,4)-(26,84)
(11,15)-(26,82)
(12,3)-(26,82)
(15,18)-(15,21)
(15,18)-(15,33)
(15,22)-(15,33)
(15,23)-(15,27)
(15,28)-(15,32)
(16,19)-(16,57)
(16,29)-(16,30)
(16,32)-(16,50)
(16,33)-(16,37)
(16,38)-(16,49)
(18,7)-(18,72)
(18,12)-(18,13)
(18,15)-(18,32)
(18,16)-(18,20)
(18,21)-(18,31)
(18,43)-(18,60)
(18,44)-(18,48)
(18,49)-(18,59)
(19,22)-(19,39)
(19,22)-(19,67)
(19,23)-(19,27)
(19,28)-(19,38)
(19,40)-(19,41)
(19,49)-(19,66)
(19,50)-(19,54)
(19,55)-(19,65)
(21,7)-(26,82)
(21,11)-(21,12)
(22,10)-(22,28)
(22,11)-(22,15)
(22,16)-(22,27)
(24,16)-(24,34)
(24,17)-(24,21)
(24,22)-(24,33)
(26,22)-(26,40)
(26,23)-(26,27)
(26,28)-(26,39)
(26,51)-(26,69)
(26,52)-(26,56)
(26,57)-(26,68)
*)
