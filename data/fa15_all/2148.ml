
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
(29,3)-(40,70)
let pi = 3.142 in
match e with
| VarX -> x
| VarY -> y
| Sine v -> sin (pi *. eval (v , x , y))
| Cosine v -> cos (pi *. eval (v , x , y))
| Average (v , w) -> (eval (v , x , y) +. eval (w , x , y)) /. 2.0
| Times (v , w) -> eval (v , x , y) *. eval (w , x , y)
LetG NonRec [(VarPatG,LitG)] (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)])

*)

(* type error slice
(26,4)-(26,29)
(26,10)-(26,27)
(29,3)-(40,70)
(32,15)-(32,18)
(32,15)-(32,42)
(32,19)-(32,42)
(32,20)-(32,22)
(33,17)-(33,20)
(33,17)-(33,44)
(33,21)-(33,44)
(33,22)-(33,24)
(34,22)-(34,63)
(37,7)-(40,70)
(37,24)-(37,25)
*)
