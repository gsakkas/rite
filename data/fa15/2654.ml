
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let buildArctan e1 = Arctan e1;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildStrange (e1,e2,e3) = Strange (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let result = rand (0, 2) in
    match result with | 0 -> buildX () | _ -> buildY ()
  else
    (let result = rand (0, 7) in
     let build1 = build (rand, (depth - 1)) in
     let build2 = build (rand, (depth - 1)) in
     let build3 = build (rand, (depth - 1)) in
     let build4 = build (rand, (depth - 1)) in
     match result with
     | 0 -> buildSine build1
     | 1 -> buildCosine build1
     | 2 -> buildAverage (build1, build2)
     | 3 -> buildTimes (build1, build2)
     | 4 -> buildThresh (build1, build2, build3, build4)
     | 5 -> buildArctan (build1, build2)
     | 6 -> buildStrange (build1, build2, build3));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let buildArctan e1 = Arctan e1;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildStrange (e1,e2,e3) = Strange (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let result = rand (0, 2) in
    match result with | 0 -> buildX () | _ -> buildY ()
  else
    (let result = rand (0, 7) in
     let build1 = build (rand, (depth - 1)) in
     let build2 = build (rand, (depth - 1)) in
     let build3 = build (rand, (depth - 1)) in
     let build4 = build (rand, (depth - 1)) in
     match result with
     | 0 -> buildSine build1
     | 1 -> buildCosine build1
     | 2 -> buildAverage (build1, build2)
     | 3 -> buildTimes (build1, build2)
     | 4 -> buildThresh (build1, build2, build3, build4)
     | 5 -> buildArctan build1
     | 6 -> buildStrange (build1, build2, build3));;

*)

(* changed spans
(48,24)-(48,40)
(48,33)-(48,39)
*)

(* type error slice
(13,3)-(13,32)
(13,16)-(13,30)
(13,21)-(13,30)
(13,28)-(13,30)
(48,12)-(48,23)
(48,12)-(48,40)
(48,24)-(48,40)
*)

(* all spans
(13,16)-(13,30)
(13,21)-(13,30)
(13,28)-(13,30)
(15,18)-(15,43)
(15,27)-(15,43)
(15,36)-(15,38)
(15,40)-(15,42)
(17,16)-(17,28)
(17,20)-(17,28)
(17,27)-(17,28)
(19,14)-(19,24)
(19,18)-(19,24)
(19,23)-(19,24)
(21,18)-(21,50)
(21,30)-(21,50)
(21,39)-(21,41)
(21,43)-(21,45)
(21,47)-(21,49)
(23,17)-(23,67)
(23,38)-(23,67)
(23,46)-(23,47)
(23,49)-(23,50)
(23,52)-(23,58)
(23,60)-(23,66)
(25,16)-(25,39)
(25,25)-(25,39)
(25,32)-(25,34)
(25,36)-(25,38)
(27,11)-(27,20)
(27,16)-(27,20)
(29,11)-(29,20)
(29,16)-(29,20)
(31,15)-(49,50)
(32,2)-(49,50)
(32,5)-(32,14)
(32,5)-(32,10)
(32,13)-(32,14)
(34,4)-(35,55)
(34,17)-(34,28)
(34,17)-(34,21)
(34,22)-(34,28)
(34,23)-(34,24)
(34,26)-(34,27)
(35,4)-(35,55)
(35,10)-(35,16)
(35,29)-(35,38)
(35,29)-(35,35)
(35,36)-(35,38)
(35,46)-(35,55)
(35,46)-(35,52)
(35,53)-(35,55)
(37,4)-(49,50)
(37,18)-(37,29)
(37,18)-(37,22)
(37,23)-(37,29)
(37,24)-(37,25)
(37,27)-(37,28)
(38,5)-(49,49)
(38,18)-(38,43)
(38,18)-(38,23)
(38,24)-(38,43)
(38,25)-(38,29)
(38,31)-(38,42)
(38,32)-(38,37)
(38,40)-(38,41)
(39,5)-(49,49)
(39,18)-(39,43)
(39,18)-(39,23)
(39,24)-(39,43)
(39,25)-(39,29)
(39,31)-(39,42)
(39,32)-(39,37)
(39,40)-(39,41)
(40,5)-(49,49)
(40,18)-(40,43)
(40,18)-(40,23)
(40,24)-(40,43)
(40,25)-(40,29)
(40,31)-(40,42)
(40,32)-(40,37)
(40,40)-(40,41)
(41,5)-(49,49)
(41,18)-(41,43)
(41,18)-(41,23)
(41,24)-(41,43)
(41,25)-(41,29)
(41,31)-(41,42)
(41,32)-(41,37)
(41,40)-(41,41)
(42,5)-(49,49)
(42,11)-(42,17)
(43,12)-(43,28)
(43,12)-(43,21)
(43,22)-(43,28)
(44,12)-(44,30)
(44,12)-(44,23)
(44,24)-(44,30)
(45,12)-(45,41)
(45,12)-(45,24)
(45,25)-(45,41)
(45,26)-(45,32)
(45,34)-(45,40)
(46,12)-(46,39)
(46,12)-(46,22)
(46,23)-(46,39)
(46,24)-(46,30)
(46,32)-(46,38)
(47,12)-(47,56)
(47,12)-(47,23)
(47,24)-(47,56)
(47,25)-(47,31)
(47,33)-(47,39)
(47,41)-(47,47)
(47,49)-(47,55)
(48,12)-(48,40)
(48,12)-(48,23)
(48,24)-(48,40)
(48,25)-(48,31)
(48,33)-(48,39)
(49,12)-(49,49)
(49,12)-(49,24)
(49,25)-(49,49)
(49,26)-(49,32)
(49,34)-(49,40)
(49,42)-(49,48)
*)
