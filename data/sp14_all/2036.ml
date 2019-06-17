
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
(14,3)-(14,61)
match e with
| VarX -> x
| Sine m -> sin (pi *. eval (m , x , y))
| _ -> x
CaseG VarG [(ConPatG Nothing,Nothing,VarG),(WildPatG,Nothing,VarG),(ConPatG (Just EmptyPatG),Nothing,AppG [EmptyG])]

(14,58)-(14,59)
(m , x , y)
TupleG [VarG,VarG,VarG]

*)

(* type error slice
(13,4)-(14,63)
(13,15)-(14,61)
(14,3)-(14,61)
(14,52)-(14,60)
(14,53)-(14,57)
(14,58)-(14,59)
*)
