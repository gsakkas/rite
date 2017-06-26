
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
(13,27)-(13,43)
(23,6)-(26,38)
(25,8)-(26,38)
(25,23)-(25,50)
*)

(* type error slice
(13,3)-(13,45)
(13,18)-(13,43)
(17,3)-(17,22)
(17,11)-(17,20)
(17,16)-(17,20)
(19,3)-(26,40)
(19,15)-(26,38)
(20,2)-(26,38)
(21,9)-(21,59)
(21,50)-(21,56)
(21,50)-(21,59)
(23,6)-(26,38)
(25,8)-(26,38)
(25,9)-(25,51)
(25,10)-(25,22)
(25,23)-(25,50)
(25,24)-(25,29)
*)

(* all spans
(13,18)-(13,43)
(13,27)-(13,43)
(13,36)-(13,38)
(13,40)-(13,42)
(15,11)-(15,20)
(15,16)-(15,20)
(17,11)-(17,20)
(17,16)-(17,20)
(19,15)-(26,38)
(20,2)-(26,38)
(20,8)-(20,13)
(21,9)-(21,59)
(21,12)-(21,29)
(21,12)-(21,25)
(21,13)-(21,17)
(21,18)-(21,24)
(21,19)-(21,20)
(21,22)-(21,23)
(21,28)-(21,29)
(21,35)-(21,44)
(21,35)-(21,41)
(21,42)-(21,44)
(21,50)-(21,59)
(21,50)-(21,56)
(21,57)-(21,59)
(23,6)-(26,38)
(23,9)-(23,26)
(23,9)-(23,22)
(23,10)-(23,14)
(23,15)-(23,21)
(23,16)-(23,17)
(23,19)-(23,20)
(23,25)-(23,26)
(25,8)-(26,38)
(25,9)-(25,51)
(25,10)-(25,22)
(25,23)-(25,50)
(25,24)-(25,29)
(25,30)-(25,49)
(25,31)-(25,35)
(25,37)-(25,48)
(25,38)-(25,43)
(25,46)-(25,47)
(26,10)-(26,37)
(26,11)-(26,16)
(26,17)-(26,36)
(26,18)-(26,22)
(26,24)-(26,35)
(26,25)-(26,30)
(26,33)-(26,34)
*)
