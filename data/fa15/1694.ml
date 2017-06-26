
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
(17,11)-(17,20)
(23,9)-(23,20)
(23,9)-(23,35)
(23,10)-(23,16)
(25,6)-(28,74)
(25,7)-(25,16)
(26,8)-(28,74)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(11,27)-(11,43)
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,22)
(17,11)-(17,20)
(17,16)-(17,20)
(19,3)-(19,22)
(19,11)-(19,20)
(19,16)-(19,20)
(21,3)-(28,76)
(21,15)-(28,74)
(22,2)-(28,74)
(23,9)-(23,20)
(23,9)-(23,35)
(23,10)-(23,16)
(23,24)-(23,35)
(23,25)-(23,31)
(25,6)-(25,45)
(25,6)-(28,74)
(25,7)-(25,16)
(25,17)-(25,44)
(25,18)-(25,23)
(26,8)-(28,74)
(26,9)-(26,50)
(26,10)-(26,21)
(27,11)-(28,73)
(27,12)-(27,24)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,11)-(17,20)
(17,16)-(17,20)
(19,11)-(19,20)
(19,16)-(19,20)
(21,15)-(28,74)
(22,2)-(28,74)
(22,8)-(22,13)
(23,9)-(23,35)
(23,9)-(23,20)
(23,10)-(23,16)
(23,17)-(23,19)
(23,24)-(23,35)
(23,25)-(23,31)
(23,32)-(23,34)
(25,6)-(28,74)
(25,6)-(25,45)
(25,7)-(25,16)
(25,17)-(25,44)
(25,18)-(25,23)
(25,24)-(25,43)
(25,25)-(25,29)
(25,31)-(25,42)
(25,32)-(25,37)
(25,40)-(25,41)
(26,8)-(28,74)
(26,9)-(26,50)
(26,10)-(26,21)
(26,22)-(26,49)
(26,23)-(26,28)
(26,29)-(26,48)
(26,30)-(26,34)
(26,36)-(26,47)
(26,37)-(26,42)
(26,45)-(26,46)
(27,11)-(28,73)
(27,12)-(27,24)
(28,14)-(28,72)
(28,15)-(28,42)
(28,16)-(28,21)
(28,22)-(28,41)
(28,23)-(28,27)
(28,29)-(28,40)
(28,30)-(28,35)
(28,38)-(28,39)
(28,44)-(28,71)
(28,45)-(28,50)
(28,51)-(28,70)
(28,52)-(28,56)
(28,58)-(28,69)
(28,59)-(28,64)
(28,67)-(28,68)
*)
