
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
(32,29)-(32,52)
(33,15)-(33,25)
(33,27)-(33,50)
(34,15)-(34,26)
(34,28)-(34,51)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,12)-(23,21)
(23,17)-(23,21)
(25,16)-(34,51)
(26,3)-(34,51)
(26,3)-(34,51)
(26,3)-(34,51)
(26,9)-(26,14)
(27,11)-(27,67)
(27,11)-(27,67)
(27,11)-(27,67)
(27,11)-(27,67)
(27,11)-(27,67)
(27,17)-(27,21)
(27,17)-(27,27)
(27,17)-(27,27)
(27,23)-(27,24)
(27,23)-(27,27)
(27,26)-(27,27)
(27,41)-(27,47)
(27,41)-(27,50)
(27,48)-(27,50)
(27,58)-(27,64)
(27,58)-(27,67)
(27,65)-(27,67)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,8)-(34,51)
(29,14)-(29,18)
(29,14)-(29,24)
(29,20)-(29,21)
(29,20)-(29,24)
(29,23)-(29,24)
(30,15)-(30,24)
(30,15)-(30,49)
(30,15)-(30,49)
(30,26)-(30,31)
(30,26)-(30,49)
(30,26)-(30,49)
(30,33)-(30,37)
(30,33)-(30,49)
(30,40)-(30,45)
(30,40)-(30,49)
(30,40)-(30,49)
(30,48)-(30,49)
(31,15)-(31,26)
(31,15)-(31,51)
(31,28)-(31,33)
(31,28)-(31,51)
(31,35)-(31,39)
(31,35)-(31,51)
(31,42)-(31,47)
(31,42)-(31,51)
(31,50)-(31,51)
(32,15)-(32,27)
(32,15)-(32,52)
(32,15)-(32,52)
(32,29)-(32,34)
(32,29)-(32,52)
(32,36)-(32,40)
(32,36)-(32,52)
(32,43)-(32,48)
(32,43)-(32,52)
(32,51)-(32,52)
(33,15)-(33,25)
(33,15)-(33,50)
(33,15)-(33,50)
(33,27)-(33,32)
(33,27)-(33,50)
(33,34)-(33,38)
(33,34)-(33,50)
(33,41)-(33,46)
(33,41)-(33,50)
(33,49)-(33,50)
(34,15)-(34,26)
(34,15)-(34,51)
(34,15)-(34,51)
(34,28)-(34,33)
(34,28)-(34,51)
(34,35)-(34,39)
(34,35)-(34,51)
(34,42)-(34,47)
(34,42)-(34,51)
(34,50)-(34,51)
*)
