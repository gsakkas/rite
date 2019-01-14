
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
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "(" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ (exprToString y))))));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi * (eval (v, x, y)))
  | Cosine v -> cos (pi * (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) + (eval (w, x, y))) / 2
  | Times (v,w) -> (eval (v, x, y)) * (eval (w, x, y))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ (exprToString y))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.142 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine v -> sin (pi *. (eval (v, x, y)))
  | Cosine v -> cos (pi *. (eval (v, x, y)))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (w, x, y));;

*)

(* changed spans
(29,2)-(40,69)
let pi = 3.142 in
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)
LetG NonRec (fromList [LitG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(29,8)-(29,9)
3.142
LitG

(29,8)-(29,9)
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,BopG EmptyG EmptyG)])

(32,18)-(32,41)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(33,20)-(33,43)
pi *. eval (v , x , y)
BopG VarG (AppG (fromList [EmptyG]))

(34,21)-(34,58)
(eval (v , x , y) +. eval (w , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(34,22)-(34,38)
eval (v , x , y) +. eval (w , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(35,19)-(35,35)
eval (v , x , y) *. eval (w , x , y)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(35,19)-(35,54)
2.0
LitG

*)
