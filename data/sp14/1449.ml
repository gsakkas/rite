
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
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 -> buildAverage (build (rand, (depth - 1)))
       | 3 -> buildTimes (build (rand, (depth - 1)))
       | 4 -> buildThresh (build (rand, (depth - 1))));;


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
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
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
       | 4 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(32,27)-(32,54)
(33,14)-(33,24)
(33,25)-(33,52)
(34,14)-(34,25)
(34,26)-(34,53)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(19,3)-(19,41)
(19,16)-(19,39)
(30,14)-(30,23)
(30,14)-(30,51)
(30,24)-(30,51)
(30,25)-(30,30)
(32,14)-(32,26)
(32,14)-(32,54)
(32,27)-(32,54)
(32,28)-(32,33)
(33,14)-(33,24)
(33,14)-(33,52)
(33,25)-(33,52)
(33,26)-(33,31)
(34,14)-(34,25)
(34,14)-(34,53)
(34,26)-(34,53)
(34,27)-(34,32)
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
(25,15)-(34,54)
(26,2)-(34,54)
(26,8)-(26,13)
(27,9)-(27,67)
(27,16)-(27,27)
(27,16)-(27,20)
(27,21)-(27,27)
(27,22)-(27,23)
(27,25)-(27,26)
(27,40)-(27,49)
(27,40)-(27,46)
(27,47)-(27,49)
(27,57)-(27,66)
(27,57)-(27,63)
(27,64)-(27,66)
(29,6)-(34,54)
(29,13)-(29,24)
(29,13)-(29,17)
(29,18)-(29,24)
(29,19)-(29,20)
(29,22)-(29,23)
(30,14)-(30,51)
(30,14)-(30,23)
(30,24)-(30,51)
(30,25)-(30,30)
(30,31)-(30,50)
(30,32)-(30,36)
(30,38)-(30,49)
(30,39)-(30,44)
(30,47)-(30,48)
(31,14)-(31,53)
(31,14)-(31,25)
(31,26)-(31,53)
(31,27)-(31,32)
(31,33)-(31,52)
(31,34)-(31,38)
(31,40)-(31,51)
(31,41)-(31,46)
(31,49)-(31,50)
(32,14)-(32,54)
(32,14)-(32,26)
(32,27)-(32,54)
(32,28)-(32,33)
(32,34)-(32,53)
(32,35)-(32,39)
(32,41)-(32,52)
(32,42)-(32,47)
(32,50)-(32,51)
(33,14)-(33,52)
(33,14)-(33,24)
(33,25)-(33,52)
(33,26)-(33,31)
(33,32)-(33,51)
(33,33)-(33,37)
(33,39)-(33,50)
(33,40)-(33,45)
(33,48)-(33,49)
(34,14)-(34,53)
(34,14)-(34,25)
(34,26)-(34,53)
(34,27)-(34,32)
(34,33)-(34,52)
(34,34)-(34,38)
(34,40)-(34,51)
(34,41)-(34,46)
(34,49)-(34,50)
*)
