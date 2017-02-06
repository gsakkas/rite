
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
  match e with | VarX  -> x | Sine m -> sin (pi *. (eval m)) | _ -> x;;


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
(14,58)-(14,59)
*)

(* type error slice
(11,4)-(11,29)
(11,10)-(11,26)
(13,4)-(14,72)
(13,15)-(14,70)
(14,3)-(14,70)
(14,3)-(14,70)
(14,3)-(14,70)
(14,3)-(14,70)
(14,3)-(14,70)
(14,3)-(14,70)
(14,3)-(14,70)
(14,9)-(14,10)
(14,27)-(14,28)
(14,41)-(14,44)
(14,41)-(14,59)
(14,46)-(14,48)
(14,46)-(14,59)
(14,46)-(14,59)
(14,53)-(14,57)
(14,53)-(14,59)
(14,53)-(14,59)
(14,58)-(14,59)
(14,69)-(14,70)
*)
