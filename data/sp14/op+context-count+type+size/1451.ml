
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

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let r = rand (0, 1) in
      if r = 0 then buildX () else if r = 1 then buildY ();;


(* fix

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

let rec build (rand,depth) =
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ();;

*)

(* changed spans
(18,6)-(19,58)
(18,23)-(18,24)
(19,35)-(19,58)
(19,38)-(19,39)
(19,38)-(19,43)
(19,42)-(19,43)
*)

(* type error slice
(13,3)-(13,22)
(13,11)-(13,20)
(13,16)-(13,20)
(19,35)-(19,58)
(19,35)-(19,58)
(19,35)-(19,58)
(19,49)-(19,55)
(19,49)-(19,58)
*)
