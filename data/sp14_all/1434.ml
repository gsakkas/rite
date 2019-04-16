
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
(18,24)-(18,25)
2
LitG

(19,36)-(19,59)
buildY ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(13,4)-(13,23)
(13,12)-(13,21)
(13,17)-(13,21)
(19,36)-(19,59)
(19,50)-(19,56)
(19,50)-(19,59)
(19,59)-(19,59)
*)
