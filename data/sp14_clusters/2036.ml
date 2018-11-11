
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
  match e with | VarX  -> x | Sine m -> sin (pi *. (eval m));;


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
  match e with | VarX  -> x | Sine m -> sin (pi *. (eval (m, x, y))) | _ -> x;;

*)

(* changed spans
(14,2)-(14,60)
match e with
| VarX -> x
| Sine m -> sin (pi *. eval (m , x , y))
| _ -> x
CaseG VarG [(Nothing,VarG),(Nothing,AppG [EmptyG]),(Nothing,VarG)]

(14,57)-(14,58)
(m , x , y)
TupleG [VarG,VarG,VarG]

*)
