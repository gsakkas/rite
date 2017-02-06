
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
      then buildSine (buildCosine (rand, (depth - 1)))
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
(31,23)-(31,34)
(31,36)-(31,52)
(35,56)-(35,72)
(57,17)-(57,40)
(57,46)-(57,69)
(62,17)-(62,40)
(62,46)-(62,69)
(65,20)-(65,43)
(65,49)-(65,72)
(79,22)-(79,45)
(79,51)-(79,74)
(81,20)-(81,43)
(81,49)-(81,72)
(85,15)-(85,38)
(85,44)-(85,67)
(86,23)-(86,28)
(86,30)-(86,34)
(86,30)-(86,46)
(86,37)-(86,42)
(86,37)-(86,46)
(86,45)-(86,46)
(87,10)-(87,15)
(87,17)-(87,21)
(87,17)-(87,33)
(87,24)-(87,29)
(87,24)-(87,33)
(87,32)-(87,33)
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
(23,16)-(87,33)
(24,3)-(87,33)
(24,3)-(87,33)
(24,3)-(87,33)
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
(29,7)-(35,72)
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
(31,12)-(31,21)
(31,12)-(31,52)
(31,12)-(31,52)
(31,23)-(31,34)
(31,23)-(31,52)
(31,23)-(31,52)
(31,36)-(31,40)
(31,36)-(31,52)
(31,43)-(31,48)
(31,43)-(31,52)
(31,43)-(31,52)
(31,51)-(31,52)
(33,9)-(33,18)
(34,12)-(34,22)
(34,12)-(35,72)
(35,16)-(35,21)
(35,16)-(35,39)
(35,16)-(35,39)
(35,16)-(35,72)
(35,23)-(35,27)
(35,23)-(35,39)
(35,30)-(35,35)
(35,30)-(35,39)
(35,38)-(35,39)
(35,45)-(35,54)
(35,45)-(35,72)
(35,45)-(35,72)
(35,56)-(35,60)
(35,56)-(35,72)
(35,63)-(35,68)
(35,63)-(35,72)
(35,71)-(35,72)
(56,13)-(56,25)
(56,13)-(57,69)
(56,13)-(58,50)
*)
