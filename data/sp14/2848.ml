
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
(21,9)-(21,15)
(22,9)-(22,56)
*)

(* type error slice
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,3)-(15,41)
(15,16)-(15,39)
(15,25)-(15,39)
(17,3)-(17,22)
(17,11)-(17,20)
(19,3)-(26,50)
(19,15)-(26,48)
(20,2)-(26,48)
(21,9)-(21,15)
(22,9)-(22,18)
(22,9)-(22,56)
(22,19)-(22,56)
(22,20)-(22,25)
(24,6)-(24,16)
(24,6)-(26,48)
*)

(* all spans
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,16)-(15,39)
(15,25)-(15,39)
(15,32)-(15,34)
(15,36)-(15,38)
(17,11)-(17,20)
(17,16)-(17,20)
(19,15)-(26,48)
(20,2)-(26,48)
(20,8)-(20,13)
(21,9)-(21,15)
(22,9)-(22,56)
(22,9)-(22,18)
(22,19)-(22,56)
(22,20)-(22,25)
(22,26)-(22,55)
(22,27)-(22,31)
(22,33)-(22,54)
(22,34)-(22,39)
(22,42)-(22,53)
(22,43)-(22,48)
(22,51)-(22,52)
(24,6)-(26,48)
(24,6)-(24,16)
(25,8)-(26,48)
(25,9)-(25,46)
(25,10)-(25,15)
(25,16)-(25,45)
(25,17)-(25,21)
(25,23)-(25,44)
(25,24)-(25,29)
(25,32)-(25,43)
(25,33)-(25,38)
(25,41)-(25,42)
(26,10)-(26,47)
(26,11)-(26,16)
(26,17)-(26,46)
(26,18)-(26,22)
(26,24)-(26,45)
(26,25)-(26,30)
(26,33)-(26,44)
(26,34)-(26,39)
(26,42)-(26,43)
*)
