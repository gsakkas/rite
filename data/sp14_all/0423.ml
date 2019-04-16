
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
(20,10)-(20,64)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(18,3)-(21,49)
(19,10)-(19,16)
(19,10)-(19,19)
(20,10)-(20,64)
(20,27)-(20,36)
(20,27)-(20,64)
(20,64)-(20,64)
*)
