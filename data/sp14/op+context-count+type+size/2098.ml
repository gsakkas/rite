
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let rec eval (e,x,y) = match e with | VarX  -> (buildX ()) * 1.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | VarX  -> x;;

*)

(* changed spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,47)-(13,64)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(13,47)-(13,58)
(13,47)-(13,64)
(13,47)-(13,64)
(13,48)-(13,54)
(13,61)-(13,64)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,14)-(13,64)
(13,23)-(13,64)
(13,29)-(13,30)
(13,47)-(13,64)
(13,47)-(13,58)
(13,48)-(13,54)
(13,55)-(13,57)
(13,61)-(13,64)
*)
