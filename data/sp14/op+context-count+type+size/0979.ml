
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> if rand > 1 then buildSine (build (rand, (depth - 1)))
  | _ -> buildCosine (build (rand, (depth - 1)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - 1)))
  | _ -> buildCosine (build (rand, (depth - 1)));;

*)

(* changed spans
(20,9)-(20,63)
(20,12)-(20,16)
(20,12)-(20,20)
(20,19)-(20,20)
(21,29)-(21,33)
*)

(* type error slice
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(20,9)-(20,63)
(20,9)-(20,63)
(20,9)-(20,63)
(20,26)-(20,35)
(20,26)-(20,63)
*)
