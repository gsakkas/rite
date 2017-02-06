
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTangent (e1,e2) = Tangent (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      if (rand (0, 1)) = 1
      then
        ((buildTangent (build (rand, (depth - 1)))),
          (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildTangent (e1,e2) = Tangent (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      if (rand (0, 1)) = 1
      then
        buildTangent
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
      else
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(13,28)-(13,43)
(23,7)-(26,35)
(25,11)-(26,35)
(25,25)-(25,48)
(26,26)-(26,31)
(26,34)-(26,35)
*)

(* type error slice
(13,4)-(13,46)
(13,19)-(13,43)
(13,28)-(13,43)
(13,37)-(13,39)
(13,41)-(13,43)
(15,4)-(15,23)
(15,12)-(15,21)
(15,12)-(15,21)
(15,17)-(15,21)
(17,4)-(17,23)
(17,12)-(17,21)
(17,12)-(17,21)
(17,17)-(17,21)
(19,16)-(26,35)
(20,3)-(26,35)
(20,3)-(26,35)
(20,3)-(26,35)
(20,9)-(20,14)
(21,10)-(21,60)
(21,10)-(21,60)
(21,14)-(21,18)
(21,14)-(21,24)
(21,14)-(21,24)
(21,14)-(21,30)
(21,14)-(21,30)
(21,14)-(21,30)
(21,20)-(21,21)
(21,20)-(21,24)
(21,23)-(21,24)
(21,29)-(21,30)
(21,36)-(21,42)
(21,36)-(21,45)
(21,43)-(21,45)
(21,51)-(21,57)
(21,51)-(21,60)
(21,58)-(21,60)
(23,7)-(26,35)
(23,7)-(26,35)
(23,7)-(26,35)
(23,11)-(23,15)
(23,11)-(23,21)
(23,11)-(23,27)
(23,11)-(23,27)
(23,17)-(23,18)
(23,17)-(23,21)
(23,20)-(23,21)
(23,26)-(23,27)
(25,11)-(25,23)
(25,11)-(25,48)
(25,11)-(25,48)
(25,11)-(26,35)
(25,25)-(25,30)
(25,25)-(25,48)
(25,25)-(25,48)
(25,32)-(25,36)
(25,32)-(25,48)
(25,39)-(25,44)
(25,39)-(25,48)
(25,39)-(25,48)
(25,47)-(25,48)
(26,12)-(26,17)
(26,12)-(26,35)
(26,19)-(26,23)
(26,19)-(26,35)
(26,26)-(26,31)
(26,26)-(26,35)
(26,34)-(26,35)
*)
