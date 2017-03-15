
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
  let res = rand (0, 4) in
  match depth with
  | 0 -> if (res mod 2) = 0 then buildX () else buildY ()
  | _ ->
      let nd = depth - 1 in
      (match res with
       | 0 -> buildAverage ((build (rand, nd)), (build (rand, nd)))
       | 1 ->
           buildThresh
             ((build (rand, nd)), (build (rand, nd)), (build (rand, nd)),
               (build (rand, nd)))
       | 2 -> buildTimes ((build (rand, nd)), (build (rand, nd)))
       | 3 -> buildSine (build (rand, nd))
       | 4 -> buildCosine ((build rand), nd));;


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
  let res = rand (0, 4) in
  match depth with
  | 0 -> if (res mod 2) = 0 then buildX () else buildY ()
  | _ ->
      let nd = depth - 1 in
      (match res with
       | 0 -> buildAverage ((build (rand, nd)), (build (rand, nd)))
       | 1 ->
           buildThresh
             ((build (rand, nd)), (build (rand, nd)), (build (rand, nd)),
               (build (rand, nd)))
       | 2 -> buildTimes ((build (rand, nd)), (build (rand, nd)))
       | 3 -> buildSine (build (rand, nd))
       | 4 -> buildCosine (build (rand, nd)));;

*)

(* changed spans
(39,26)-(39,44)
(39,34)-(39,38)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(32,28)-(32,46)
(32,29)-(32,34)
(32,35)-(32,45)
(32,36)-(32,40)
(39,14)-(39,25)
(39,14)-(39,44)
(39,26)-(39,44)
(39,27)-(39,39)
(39,28)-(39,33)
(39,34)-(39,38)
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
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,15)-(39,45)
(26,2)-(39,45)
(26,12)-(26,23)
(26,12)-(26,16)
(26,17)-(26,23)
(26,18)-(26,19)
(26,21)-(26,22)
(27,2)-(39,45)
(27,8)-(27,13)
(28,9)-(28,57)
(28,12)-(28,27)
(28,12)-(28,23)
(28,13)-(28,16)
(28,21)-(28,22)
(28,26)-(28,27)
(28,33)-(28,42)
(28,33)-(28,39)
(28,40)-(28,42)
(28,48)-(28,57)
(28,48)-(28,54)
(28,55)-(28,57)
(30,6)-(39,45)
(30,15)-(30,24)
(30,15)-(30,20)
(30,23)-(30,24)
(31,6)-(39,45)
(31,13)-(31,16)
(32,14)-(32,67)
(32,14)-(32,26)
(32,27)-(32,67)
(32,28)-(32,46)
(32,29)-(32,34)
(32,35)-(32,45)
(32,36)-(32,40)
(32,42)-(32,44)
(32,48)-(32,66)
(32,49)-(32,54)
(32,55)-(32,65)
(32,56)-(32,60)
(32,62)-(32,64)
(34,11)-(36,34)
(34,11)-(34,22)
(35,13)-(36,34)
(35,14)-(35,32)
(35,15)-(35,20)
(35,21)-(35,31)
(35,22)-(35,26)
(35,28)-(35,30)
(35,34)-(35,52)
(35,35)-(35,40)
(35,41)-(35,51)
(35,42)-(35,46)
(35,48)-(35,50)
(35,54)-(35,72)
(35,55)-(35,60)
(35,61)-(35,71)
(35,62)-(35,66)
(35,68)-(35,70)
(36,15)-(36,33)
(36,16)-(36,21)
(36,22)-(36,32)
(36,23)-(36,27)
(36,29)-(36,31)
(37,14)-(37,65)
(37,14)-(37,24)
(37,25)-(37,65)
(37,26)-(37,44)
(37,27)-(37,32)
(37,33)-(37,43)
(37,34)-(37,38)
(37,40)-(37,42)
(37,46)-(37,64)
(37,47)-(37,52)
(37,53)-(37,63)
(37,54)-(37,58)
(37,60)-(37,62)
(38,14)-(38,42)
(38,14)-(38,23)
(38,24)-(38,42)
(38,25)-(38,30)
(38,31)-(38,41)
(38,32)-(38,36)
(38,38)-(38,40)
(39,14)-(39,44)
(39,14)-(39,25)
(39,26)-(39,44)
(39,27)-(39,39)
(39,28)-(39,33)
(39,34)-(39,38)
(39,41)-(39,43)
*)
