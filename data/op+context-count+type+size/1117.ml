
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
(39,56)-(39,72)
(61,17)-(61,40)
(61,46)-(61,69)
(66,17)-(66,40)
(66,46)-(66,69)
(69,20)-(69,43)
(69,49)-(69,72)
(83,22)-(83,45)
(83,51)-(83,74)
(85,20)-(85,43)
(85,49)-(85,72)
(89,15)-(89,38)
(89,44)-(89,67)
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
(23,16)-(91,33)
(24,3)-(91,33)
(24,3)-(91,33)
(24,3)-(91,33)
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
(29,7)-(39,72)
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
(32,9)-(35,53)
(32,9)-(35,53)
(33,12)-(33,22)
(33,12)-(35,53)
(33,12)-(35,53)
(34,16)-(34,21)
(34,16)-(34,39)
(34,16)-(34,39)
(34,16)-(35,53)
(34,23)-(34,27)
(34,23)-(34,39)
(34,30)-(34,35)
(34,30)-(34,39)
(34,30)-(34,39)
(34,38)-(34,39)
(35,17)-(35,28)
(35,17)-(35,53)
(35,17)-(35,53)
(35,30)-(35,35)
(35,30)-(35,53)
(35,37)-(35,41)
(35,37)-(35,53)
(35,44)-(35,49)
(35,44)-(35,53)
(35,52)-(35,53)
(37,9)-(37,18)
(38,12)-(38,22)
(39,16)-(39,21)
(39,16)-(39,39)
(39,16)-(39,72)
(39,23)-(39,27)
(39,23)-(39,39)
(39,30)-(39,35)
(39,30)-(39,39)
(39,38)-(39,39)
(39,45)-(39,54)
(39,45)-(39,72)
(39,45)-(39,72)
(39,56)-(39,60)
(39,56)-(39,72)
(39,63)-(39,68)
(39,63)-(39,72)
(39,71)-(39,72)
(60,13)-(60,25)
(60,13)-(61,69)
(60,13)-(62,50)
*)
