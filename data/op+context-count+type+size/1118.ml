
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
  | 0 ->
      let num = rand (1, 10) in
      if (num > 7) || (num = 2) then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))), (buildCosine (rand, (depth - 1)))))
      else
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))), (buildSine (rand, (depth - 1)))))
  | 2 ->
      let num = rand (1, 30) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
      else
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
  | 3 ->
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (buildSine (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;


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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 ->
      let num = rand (1, 10) in
      if (num > 7) || (num = 2) then buildX () else buildY ()
  | 1 ->
      let num = rand (1, 10) in
      if (num mod 2) = 0
      then
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1))))))
      else
        buildSine
          (buildTimes
             ((build (rand, (depth - 1))),
               (buildSine (build (rand, (depth - 1))))))
  | 2 ->
      let num = rand (1, 30) in
      if (num mod 2) == 0
      then
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
      else
        buildTimes
          ((buildSine (build (rand, (depth - 1)))),
            (buildTimes
               ((build (rand, (depth - 1))),
                 (buildSine (build (rand, (depth - 1)))))))
  | 3 ->
      let num = rand (1, 50) in
      if (num mod 2) = 0
      then
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildCosine (build (rand, (depth - 1)))))
      else
        buildTimes
          ((buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
            (buildSine (build (rand, (depth - 1)))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      let num = rand (1, 10) in
      if num = 1
      then buildSine (buildSine (buildSine (build (rand, (depth - 1)))))
      else
        if num = 2
        then
          buildCosine (buildCosine (buildCosine (build (rand, (depth - 1)))))
        else
          if num = 3
          then buildSine (buildCosine (build (rand, (depth - 1))))
          else buildCosine (buildSine (build (rand, (depth - 1))))
  | 6 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 7 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 8 ->
      buildTimes
        ((buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))),
          (buildSine (build (rand, (depth - 1)))))
  | _ -> build (rand, (depth - 1));;

*)

(* changed spans
(34,58)-(34,74)
(38,56)-(38,72)
(60,17)-(60,40)
(60,46)-(60,69)
(65,17)-(65,40)
(65,46)-(65,69)
(68,20)-(68,43)
(68,49)-(68,72)
(82,22)-(82,45)
(82,51)-(82,74)
(84,20)-(84,43)
(84,49)-(84,72)
(88,15)-(88,38)
(88,44)-(88,67)
(90,24)-(90,29)
(90,32)-(90,33)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
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
(17,4)-(17,42)
(17,17)-(17,39)
(17,26)-(17,39)
(17,33)-(17,35)
(17,37)-(17,39)
(19,4)-(19,23)
(19,12)-(19,21)
(19,12)-(19,21)
(19,17)-(19,21)
(21,4)-(21,23)
(21,12)-(21,21)
(21,12)-(21,21)
(21,17)-(21,21)
(23,16)-(90,33)
(24,3)-(90,33)
(24,3)-(90,33)
(24,3)-(90,33)
(24,9)-(24,14)
(26,7)-(27,62)
(26,7)-(27,62)
(26,17)-(26,21)
(26,17)-(26,28)
(26,17)-(26,28)
(26,23)-(26,24)
(26,23)-(26,28)
(26,26)-(26,28)
(27,7)-(27,62)
(27,7)-(27,62)
(27,11)-(27,14)
(27,11)-(27,18)
(27,11)-(27,18)
(27,11)-(27,18)
(27,11)-(27,31)
(27,17)-(27,18)
(27,24)-(27,27)
(27,24)-(27,31)
(27,24)-(27,31)
(27,30)-(27,31)
(27,38)-(27,44)
(27,38)-(27,47)
(27,45)-(27,47)
(27,53)-(27,59)
(27,53)-(27,62)
(27,60)-(27,62)
(29,7)-(38,72)
(29,17)-(29,21)
(29,17)-(29,28)
(29,23)-(29,24)
(29,23)-(29,28)
(29,26)-(29,28)
(30,11)-(30,14)
(30,11)-(30,20)
(30,11)-(30,25)
(30,11)-(30,25)
(30,19)-(30,20)
(30,24)-(30,25)
(32,9)-(32,18)
(32,9)-(34,74)
(32,9)-(34,74)
(33,12)-(33,22)
(33,12)-(34,74)
(33,12)-(34,74)
(34,16)-(34,21)
(34,16)-(34,39)
(34,16)-(34,39)
(34,16)-(34,74)
(34,23)-(34,27)
(34,23)-(34,39)
(34,30)-(34,35)
(34,30)-(34,39)
(34,30)-(34,39)
(34,38)-(34,39)
(34,45)-(34,56)
(34,45)-(34,74)
(34,45)-(34,74)
(34,58)-(34,62)
(34,58)-(34,74)
(34,65)-(34,70)
(34,65)-(34,74)
(34,73)-(34,74)
(36,9)-(36,18)
(37,12)-(37,22)
(38,16)-(38,21)
(38,16)-(38,39)
(38,16)-(38,72)
(38,23)-(38,27)
(38,23)-(38,39)
(38,30)-(38,35)
(38,30)-(38,39)
(38,38)-(38,39)
(38,45)-(38,54)
(38,45)-(38,72)
(38,45)-(38,72)
(38,56)-(38,60)
(38,56)-(38,72)
(38,63)-(38,68)
(38,63)-(38,72)
(38,71)-(38,72)
(59,13)-(59,25)
(59,13)-(60,69)
(59,13)-(61,50)
*)
