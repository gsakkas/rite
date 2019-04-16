
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
  let r = rand (0. depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d -> if r = 0 then build (rand, (d - 1)) else build (rand, (d - 1));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else build (rand, (d - 1));;

*)

(* changed spans
(16,16)-(16,26)
(0 , depth)
TupleG (fromList [VarG,LitG])

(18,32)-(18,38)
buildX ()
AppG (fromList [ConAppG Nothing])

(18,44)-(18,50)
buildY ()
AppG (fromList [ConAppG Nothing])

(19,24)-(19,45)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(16,16)-(16,26)
(16,17)-(16,19)
*)
