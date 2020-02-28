
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX
  | 1 -> buildSine (build (rand, (depth - (depth - 1))))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - (depth - 1))))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;

*)

(* changed spans
(21,10)-(21,16)
buildX ()
AppG [ConAppG Nothing]

*)

(* type error slice
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(13,24)-(13,25)
(15,4)-(15,42)
(15,17)-(15,40)
(15,26)-(15,40)
(17,4)-(17,23)
(17,12)-(17,21)
(19,4)-(26,51)
(19,16)-(26,49)
(20,3)-(26,49)
(21,10)-(21,16)
(22,10)-(22,19)
(22,10)-(22,57)
(22,20)-(22,57)
(22,21)-(22,26)
(24,7)-(24,17)
(24,7)-(26,49)
*)
