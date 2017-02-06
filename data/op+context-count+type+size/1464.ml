
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
(17,17)-(17,39)
(37,17)-(37,40)
(37,46)-(37,69)
(39,13)-(42,71)
(42,19)-(42,42)
(42,48)-(42,71)
(42,55)-(42,59)
(42,62)-(42,67)
(42,62)-(42,71)
(42,70)-(42,71)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,24)-(15,25)
(17,4)-(17,42)
(17,17)-(17,39)
(17,33)-(17,35)
(17,37)-(17,39)
(19,4)-(19,23)
(19,12)-(19,21)
(21,4)-(21,23)
(21,12)-(21,21)
(23,16)-(42,71)
(24,3)-(42,71)
(24,9)-(24,14)
(25,10)-(25,71)
(25,10)-(25,71)
(25,18)-(25,22)
(25,18)-(25,28)
(25,33)-(25,71)
(25,33)-(25,71)
(25,36)-(25,37)
(25,36)-(25,41)
(25,47)-(25,53)
(25,47)-(25,56)
(25,62)-(25,68)
(25,62)-(25,71)
(28,7)-(42,71)
(29,12)-(29,21)
(29,12)-(29,46)
(29,23)-(29,28)
(29,23)-(29,46)
(29,37)-(29,42)
(31,9)-(42,71)
(32,14)-(32,25)
(32,14)-(32,50)
(34,11)-(42,71)
(36,13)-(36,25)
(36,13)-(37,69)
(39,13)-(42,71)
(41,15)-(41,25)
(41,15)-(42,71)
*)
