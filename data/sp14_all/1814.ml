
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi * (exprToString e1))
  | Cosine e1 -> cos (pi * (exprToString e1))
  | Average (e1,e2) -> ((exprToString e1) + (exprToString e2)) / 2
  | Times (e1,e2) -> (exprToString e1) * (exprToString e2)
  | Thresh (e1,e2,e3,e4) ->
      if (exprToString e1) < (exprToString e2)
      then exprToString e3
      else exprToString e4;;


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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(34,20)-(34,44)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(35,22)-(35,46)
pi *. eval (e1 , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(36,24)-(36,67)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(37,22)-(37,59)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(39,10)-(39,27)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(39,30)-(39,47)
eval (e2 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(40,12)-(40,27)
eval (e3 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(41,12)-(41,27)
eval (e4 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(15,28)-(15,53)
(15,29)-(15,46)
(15,30)-(15,42)
(15,47)-(15,48)
(28,4)-(28,29)
(28,10)-(28,27)
(31,3)-(41,27)
(34,16)-(34,19)
(34,16)-(34,44)
(34,20)-(34,44)
(34,21)-(34,23)
(34,26)-(34,43)
(34,27)-(34,39)
(35,18)-(35,21)
(35,18)-(35,46)
(35,22)-(35,46)
(35,23)-(35,25)
(35,28)-(35,45)
(35,29)-(35,41)
(36,24)-(36,63)
(36,24)-(36,67)
(36,25)-(36,42)
(36,26)-(36,38)
(36,45)-(36,62)
(36,46)-(36,58)
(37,22)-(37,39)
(37,22)-(37,59)
(37,23)-(37,35)
(37,42)-(37,59)
(37,43)-(37,55)
*)
