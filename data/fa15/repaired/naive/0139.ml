type  expr =
| VarX
| VarY
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
    | Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))

let pi = 4.0 *. atan 1.0

let rec eval =
  fun (e , x , y) ->
    exprToString (__fun_1__ __var_1__)


(* -------------------------------------- *)

type  expr =
| VarX
| VarY
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
    | Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))

let pi = 4.0 *. atan 1.0

let rec eval =
  fun (e , x , y) ->
    exprToString __lit__


(* -------------------------------------- *)

type  expr =
| VarX
| VarY
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
    | Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))

let pi = 4.0 *. atan 1.0

let rec eval =
  fun (e , x , y) ->
    exprToString (__fun_1__ __var_1__
                            __var_2__)


(* -------------------------------------- *)


(* bad

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
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) ->
      ((eval (e1, x, y)) +. (exprToString eval (e2, x, y))) / 2
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* student fix

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
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans

(37,7)-(37,64)
(eval (e1 , x , y) +. eval (e2 , x , y)) /. 2.0
BopG (BopG EmptyG EmptyG) LitG

(38,22)-(38,67)
eval (e1 , x , y) *. eval (e2 , x , y)
BopG (AppG [EmptyG]) (AppG [EmptyG])

(40,7)-(45,80)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (AppG [EmptyG])

*)
