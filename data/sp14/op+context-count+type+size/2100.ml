
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec eval (e,x,y) =
  match e with | VarX  -> buildX * 1.0 | VarY  -> buildY * 1.0;;


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
(13,11)-(13,20)
(13,16)-(13,20)
(16,2)-(16,62)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(13,3)-(13,22)
(13,11)-(13,20)
(16,26)-(16,32)
(16,26)-(16,38)
(16,26)-(16,38)
(16,35)-(16,38)
(16,50)-(16,56)
(16,50)-(16,62)
(16,50)-(16,62)
(16,59)-(16,62)
*)
