
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exprToString a) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "_"
  | Cube a ->
      "(" ^
        ((exprToString a) ^
           ("*" ^ ((exprToString a) ^ ("*" ^ ((exprToString a) ^ ")")))))
  | Addition (a,b) ->
      "(" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ ")")));;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((exprToString a) * (exprToString a)) * (exprToString a);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cube of expr
  | Addition of expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cube a -> ((eval (a, x, y)) *. (eval (a, x, y))) *. (eval (a, x, y));;

*)

(* changed spans
(50,14)-(50,51)
(eval (a , x , y) *. eval (a , x , y)) *. eval (a , x , y)
BopG (BopG EmptyG EmptyG) (AppG [EmptyG])

(50,15)-(50,31)
eval (a , x , y) *. eval (a , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(50,16)-(50,28)
eval
VarG

(50,29)-(50,30)
(a , x , y)
TupleG [VarG,VarG,VarG]

(50,34)-(50,50)
x
VarG

(50,34)-(50,50)
y
VarG

(50,35)-(50,47)
eval
VarG

(50,48)-(50,49)
(a , x , y)
TupleG [VarG,VarG,VarG]

(50,54)-(50,70)
x
VarG

(50,54)-(50,70)
y
VarG

(50,55)-(50,67)
eval
VarG

(50,68)-(50,69)
(a , x , y)
TupleG [VarG,VarG,VarG]

*)
