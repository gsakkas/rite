
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
(19,36)-(19,59)
(19,39)-(19,40)
(19,39)-(19,44)
(19,43)-(19,44)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(15,4)-(19,61)
(15,16)-(19,59)
(16,9)-(16,14)
(18,7)-(19,59)
(18,15)-(18,19)
(18,15)-(18,25)
(19,7)-(19,59)
(19,10)-(19,11)
(19,10)-(19,15)
(19,21)-(19,27)
(19,21)-(19,30)
(19,36)-(19,59)
(19,50)-(19,56)
(19,50)-(19,59)
*)
