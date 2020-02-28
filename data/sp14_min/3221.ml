
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
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (exprToString ex))
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


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
  | Sine ex -> sin (pi *. (eval (ex, x, y)));;

*)

(* changed spans
(31,3)-(45,82)
match e with
| VarX -> x
| VarY -> y
| Sine ex -> sin (pi *. eval (ex , x , y))
CaseG VarG [(ConPatG Nothing,Nothing,VarG),(ConPatG Nothing,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG])]

(34,27)-(34,44)
eval (ex , x , y)
AppG [TupleG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(15,28)-(15,53)
(15,29)-(15,46)
(15,30)-(15,42)
(15,47)-(15,48)
(31,3)-(45,82)
(34,16)-(34,19)
(34,16)-(34,45)
(34,20)-(34,45)
(34,27)-(34,44)
(34,28)-(34,40)
(35,18)-(35,55)
(35,28)-(35,29)
(37,7)-(37,74)
(37,12)-(37,13)
(38,24)-(38,71)
(38,43)-(38,44)
(40,7)-(45,82)
(40,11)-(40,12)
*)
