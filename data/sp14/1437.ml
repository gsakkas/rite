
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 5) in
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else
        if r = 1
        then buildCosine (build (rand, (depth - 1)))
        else
          if r = 2
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if r = 3
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 5) in
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else
        if r = 1
        then buildCosine (build (rand, (depth - 1)))
        else
          if r = 2
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if r = 3
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              buildThresh
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                  (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(17,16)-(17,39)
(39,12)-(42,74)
*)

(* type error slice
(17,3)-(17,41)
(17,16)-(17,39)
(17,25)-(17,39)
(21,3)-(21,22)
(21,11)-(21,20)
(21,16)-(21,20)
(24,2)-(42,74)
(25,9)-(25,70)
(25,32)-(25,70)
(25,61)-(25,67)
(25,61)-(25,70)
(27,6)-(42,74)
(28,6)-(42,74)
(31,8)-(42,74)
(34,10)-(42,74)
(39,12)-(42,74)
(41,14)-(41,24)
(41,14)-(42,74)
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
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(19,11)-(19,20)
(19,16)-(19,20)
(21,11)-(21,20)
(21,16)-(21,20)
(23,15)-(42,74)
(24,2)-(42,74)
(24,8)-(24,13)
(25,9)-(25,70)
(25,17)-(25,28)
(25,17)-(25,21)
(25,22)-(25,28)
(25,23)-(25,24)
(25,26)-(25,27)
(25,32)-(25,70)
(25,35)-(25,40)
(25,35)-(25,36)
(25,39)-(25,40)
(25,46)-(25,55)
(25,46)-(25,52)
(25,53)-(25,55)
(25,61)-(25,70)
(25,61)-(25,67)
(25,68)-(25,70)
(27,6)-(42,74)
(27,14)-(27,25)
(27,14)-(27,18)
(27,19)-(27,25)
(27,20)-(27,21)
(27,23)-(27,24)
(28,6)-(42,74)
(28,9)-(28,14)
(28,9)-(28,10)
(28,13)-(28,14)
(29,11)-(29,48)
(29,11)-(29,20)
(29,21)-(29,48)
(29,22)-(29,27)
(29,28)-(29,47)
(29,29)-(29,33)
(29,35)-(29,46)
(29,36)-(29,41)
(29,44)-(29,45)
(31,8)-(42,74)
(31,11)-(31,16)
(31,11)-(31,12)
(31,15)-(31,16)
(32,13)-(32,52)
(32,13)-(32,24)
(32,25)-(32,52)
(32,26)-(32,31)
(32,32)-(32,51)
(32,33)-(32,37)
(32,39)-(32,50)
(32,40)-(32,45)
(32,48)-(32,49)
(34,10)-(42,74)
(34,13)-(34,18)
(34,13)-(34,14)
(34,17)-(34,18)
(36,12)-(37,72)
(36,12)-(36,24)
(37,14)-(37,72)
(37,15)-(37,42)
(37,16)-(37,21)
(37,22)-(37,41)
(37,23)-(37,27)
(37,29)-(37,40)
(37,30)-(37,35)
(37,38)-(37,39)
(37,44)-(37,71)
(37,45)-(37,50)
(37,51)-(37,70)
(37,52)-(37,56)
(37,58)-(37,69)
(37,59)-(37,64)
(37,67)-(37,68)
(39,12)-(42,74)
(39,15)-(39,20)
(39,15)-(39,16)
(39,19)-(39,20)
(41,14)-(42,74)
(41,14)-(41,24)
(42,16)-(42,74)
(42,17)-(42,44)
(42,18)-(42,23)
(42,24)-(42,43)
(42,25)-(42,29)
(42,31)-(42,42)
(42,32)-(42,37)
(42,40)-(42,41)
(42,46)-(42,73)
(42,47)-(42,52)
(42,53)-(42,72)
(42,54)-(42,58)
(42,60)-(42,71)
(42,61)-(42,66)
(42,69)-(42,70)
*)
