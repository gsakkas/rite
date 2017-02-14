
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
(26,25)-(26,30)
(26,33)-(26,34)
*)

(* type error slice
(15,3)-(15,22)
(15,11)-(15,20)
(15,16)-(15,20)
(19,3)-(26,40)
(19,15)-(26,38)
(20,2)-(26,38)
(20,2)-(26,38)
(21,9)-(21,59)
(21,35)-(21,41)
(21,35)-(21,44)
(23,6)-(26,38)
(23,6)-(26,38)
(23,6)-(26,38)
(25,8)-(26,38)
(26,10)-(26,37)
(26,11)-(26,16)
*)
