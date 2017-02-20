
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
(14,57)-(14,58)
*)

(* type error slice
(13,3)-(14,62)
(13,14)-(14,60)
(14,2)-(14,60)
(14,51)-(14,59)
(14,52)-(14,56)
(14,57)-(14,58)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(14,60)
(14,2)-(14,60)
(14,8)-(14,9)
(14,26)-(14,27)
(14,40)-(14,60)
(14,40)-(14,43)
(14,44)-(14,60)
(14,45)-(14,47)
(14,51)-(14,59)
(14,52)-(14,56)
(14,57)-(14,58)
*)
