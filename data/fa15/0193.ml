
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

let rec build (rand,depth) =
  let r = ((rand 1), 6) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  | 0 -> buildX ()
  | 1 -> buildY ()
  | _ ->
      let r = rand (1, 6) in
      (match r with
       | 1 -> buildSine (build (rand, (depth - 1)))
       | 2 -> buildCosine (build (rand, (depth - 1)))
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(21,15)-(33,67)
(22,2)-(33,67)
(22,10)-(22,23)
(22,17)-(22,18)
*)

(* type error slice
(22,2)-(33,67)
(22,10)-(22,23)
(23,2)-(33,67)
(23,8)-(23,9)
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
(21,15)-(33,67)
(22,2)-(33,67)
(22,10)-(22,23)
(22,11)-(22,19)
(22,12)-(22,16)
(22,17)-(22,18)
(22,21)-(22,22)
(23,2)-(33,67)
(23,8)-(23,9)
(24,9)-(24,46)
(24,9)-(24,18)
(24,19)-(24,46)
(24,20)-(24,25)
(24,26)-(24,45)
(24,27)-(24,31)
(24,33)-(24,44)
(24,34)-(24,39)
(24,42)-(24,43)
(25,9)-(25,48)
(25,9)-(25,20)
(25,21)-(25,48)
(25,22)-(25,27)
(25,28)-(25,47)
(25,29)-(25,33)
(25,35)-(25,46)
(25,36)-(25,41)
(25,44)-(25,45)
(27,6)-(27,77)
(27,6)-(27,18)
(27,19)-(27,77)
(27,20)-(27,47)
(27,21)-(27,26)
(27,27)-(27,46)
(27,28)-(27,32)
(27,34)-(27,45)
(27,35)-(27,40)
(27,43)-(27,44)
(27,49)-(27,76)
(27,50)-(27,55)
(27,56)-(27,75)
(27,57)-(27,61)
(27,63)-(27,74)
(27,64)-(27,69)
(27,72)-(27,73)
(29,6)-(29,75)
(29,6)-(29,16)
(29,17)-(29,75)
(29,18)-(29,45)
(29,19)-(29,24)
(29,25)-(29,44)
(29,26)-(29,30)
(29,32)-(29,43)
(29,33)-(29,38)
(29,41)-(29,42)
(29,47)-(29,74)
(29,48)-(29,53)
(29,54)-(29,73)
(29,55)-(29,59)
(29,61)-(29,72)
(29,62)-(29,67)
(29,70)-(29,71)
(31,6)-(33,67)
(31,6)-(31,17)
(32,8)-(33,67)
(32,9)-(32,36)
(32,10)-(32,15)
(32,16)-(32,35)
(32,17)-(32,21)
(32,23)-(32,34)
(32,24)-(32,29)
(32,32)-(32,33)
(32,38)-(32,65)
(32,39)-(32,44)
(32,45)-(32,64)
(32,46)-(32,50)
(32,52)-(32,63)
(32,53)-(32,58)
(32,61)-(32,62)
(33,10)-(33,37)
(33,11)-(33,16)
(33,17)-(33,36)
(33,18)-(33,22)
(33,24)-(33,35)
(33,25)-(33,30)
(33,33)-(33,34)
(33,39)-(33,66)
(33,40)-(33,45)
(33,46)-(33,65)
(33,47)-(33,51)
(33,53)-(33,64)
(33,54)-(33,59)
(33,62)-(33,63)
*)
