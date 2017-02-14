
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
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(19,4)-(26,41)
(19,16)-(26,35)
(20,3)-(26,35)
(20,3)-(26,35)
(21,10)-(21,60)
(21,36)-(21,42)
(21,36)-(21,45)
(23,7)-(26,35)
(23,7)-(26,35)
(23,7)-(26,35)
(25,11)-(26,35)
(26,12)-(26,17)
(26,12)-(26,35)
*)
