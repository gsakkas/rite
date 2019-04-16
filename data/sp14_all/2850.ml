
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
(25,9)-(26,39)
buildTangent (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(26,39)-(26,39)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(13,4)-(13,46)
(13,19)-(13,44)
(17,4)-(17,23)
(17,12)-(17,21)
(17,17)-(17,21)
(19,4)-(26,41)
(19,16)-(26,39)
(20,3)-(26,39)
(21,10)-(21,60)
(21,51)-(21,57)
(21,51)-(21,60)
(23,7)-(26,39)
(25,9)-(26,39)
(25,10)-(25,52)
(25,11)-(25,23)
(25,24)-(25,51)
(25,25)-(25,30)
(26,39)-(26,39)
*)
