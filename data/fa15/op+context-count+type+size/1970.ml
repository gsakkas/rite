
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (buildX ()) || (buildY ())
  | _ ->
      (buildSine (build (rand, (depth - 1)))) ||
        ((buildCosine (build (rand, (depth - 1)))) ||
           (buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 3 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(17,12)-(17,21)
(23,11)-(23,17)
(23,11)-(23,20)
(23,11)-(23,35)
(25,8)-(25,17)
(25,8)-(28,69)
(26,11)-(28,69)
(26,38)-(26,43)
(26,46)-(26,47)
(27,13)-(27,25)
(28,17)-(28,22)
(28,17)-(28,69)
(28,24)-(28,28)
(28,24)-(28,40)
(28,31)-(28,36)
(28,31)-(28,40)
(28,39)-(28,40)
(28,46)-(28,51)
(28,53)-(28,57)
(28,53)-(28,69)
(28,60)-(28,65)
(28,60)-(28,69)
(28,68)-(28,69)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,23)
(17,12)-(17,21)
(17,17)-(17,21)
(19,4)-(19,23)
(19,12)-(19,21)
(19,17)-(19,21)
(21,4)-(28,77)
(21,16)-(28,69)
(22,3)-(28,69)
(23,11)-(23,17)
(23,11)-(23,20)
(23,11)-(23,35)
(23,11)-(23,35)
(23,11)-(23,35)
(23,26)-(23,32)
(23,26)-(23,35)
(25,8)-(25,17)
(25,8)-(25,42)
(25,8)-(28,69)
(25,19)-(25,24)
(25,19)-(25,42)
(26,11)-(26,22)
(26,11)-(26,47)
(26,11)-(28,69)
(26,11)-(28,69)
(27,13)-(27,25)
(27,13)-(28,69)
*)
