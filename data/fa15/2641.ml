
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Exponential of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildExponential (e1,e2) = Exponential (e1, e2);;

let buildSine e = Sine e;;

let buildSquare e = Square e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (1, 7) in
  let d = depth - 1 in
  if d != 0
  then
    match r with
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 4 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 5 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 6 -> buildSquare ((build (rand, d)), (build (rand, d)))
    | _ -> buildExponential ((build (rand, d)), (build (rand, d)))
  else
    (let rr = rand (1, 8) in
     match rr with | 6 -> buildX () | 8 -> buildY () | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Exponential of expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildExponential (e1,e2) = Exponential (e1, e2);;

let buildSine e = Sine e;;

let buildSquare e = Square e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (1, 7) in
  let d = depth - 1 in
  if d != 0
  then
    match r with
    | 1 -> buildSine (build (rand, d))
    | 2 -> buildCosine (build (rand, d))
    | 3 -> buildAverage ((build (rand, d)), (build (rand, d)))
    | 4 -> buildTimes ((build (rand, d)), (build (rand, d)))
    | 5 ->
        buildThresh
          ((build (rand, d)), (build (rand, d)), (build (rand, d)),
            (build (rand, d)))
    | 6 -> buildSquare (build (rand, d))
    | _ -> buildExponential ((build (rand, d)), (build (rand, d)))
  else
    (let rr = rand (1, 8) in
     match rr with | 6 -> buildX () | 8 -> buildY () | _ -> buildX ());;

*)

(* changed spans
(45,23)-(45,61)
(45,44)-(45,49)
(45,50)-(45,59)
(45,51)-(45,55)
(45,57)-(45,58)
(46,11)-(46,66)
*)

(* type error slice
(21,3)-(21,30)
(21,16)-(21,28)
(21,20)-(21,28)
(21,27)-(21,28)
(45,11)-(45,22)
(45,11)-(45,61)
(45,23)-(45,61)
*)

(* all spans
(13,18)-(13,43)
(13,27)-(13,43)
(13,36)-(13,38)
(13,40)-(13,42)
(15,16)-(15,28)
(15,20)-(15,28)
(15,27)-(15,28)
(17,22)-(17,51)
(17,31)-(17,51)
(17,44)-(17,46)
(17,48)-(17,50)
(19,14)-(19,24)
(19,18)-(19,24)
(19,23)-(19,24)
(21,16)-(21,28)
(21,20)-(21,28)
(21,27)-(21,28)
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
(31,15)-(49,70)
(32,2)-(49,70)
(32,10)-(32,21)
(32,10)-(32,14)
(32,15)-(32,21)
(32,16)-(32,17)
(32,19)-(32,20)
(33,2)-(49,70)
(33,10)-(33,19)
(33,10)-(33,15)
(33,18)-(33,19)
(34,2)-(49,70)
(34,5)-(34,11)
(34,5)-(34,6)
(34,10)-(34,11)
(36,4)-(46,66)
(36,10)-(36,11)
(37,11)-(37,38)
(37,11)-(37,20)
(37,21)-(37,38)
(37,22)-(37,27)
(37,28)-(37,37)
(37,29)-(37,33)
(37,35)-(37,36)
(38,11)-(38,40)
(38,11)-(38,22)
(38,23)-(38,40)
(38,24)-(38,29)
(38,30)-(38,39)
(38,31)-(38,35)
(38,37)-(38,38)
(39,11)-(39,62)
(39,11)-(39,23)
(39,24)-(39,62)
(39,25)-(39,42)
(39,26)-(39,31)
(39,32)-(39,41)
(39,33)-(39,37)
(39,39)-(39,40)
(39,44)-(39,61)
(39,45)-(39,50)
(39,51)-(39,60)
(39,52)-(39,56)
(39,58)-(39,59)
(40,11)-(40,60)
(40,11)-(40,21)
(40,22)-(40,60)
(40,23)-(40,40)
(40,24)-(40,29)
(40,30)-(40,39)
(40,31)-(40,35)
(40,37)-(40,38)
(40,42)-(40,59)
(40,43)-(40,48)
(40,49)-(40,58)
(40,50)-(40,54)
(40,56)-(40,57)
(42,8)-(44,30)
(42,8)-(42,19)
(43,10)-(44,30)
(43,11)-(43,28)
(43,12)-(43,17)
(43,18)-(43,27)
(43,19)-(43,23)
(43,25)-(43,26)
(43,30)-(43,47)
(43,31)-(43,36)
(43,37)-(43,46)
(43,38)-(43,42)
(43,44)-(43,45)
(43,49)-(43,66)
(43,50)-(43,55)
(43,56)-(43,65)
(43,57)-(43,61)
(43,63)-(43,64)
(44,12)-(44,29)
(44,13)-(44,18)
(44,19)-(44,28)
(44,20)-(44,24)
(44,26)-(44,27)
(45,11)-(45,61)
(45,11)-(45,22)
(45,23)-(45,61)
(45,24)-(45,41)
(45,25)-(45,30)
(45,31)-(45,40)
(45,32)-(45,36)
(45,38)-(45,39)
(45,43)-(45,60)
(45,44)-(45,49)
(45,50)-(45,59)
(45,51)-(45,55)
(45,57)-(45,58)
(46,11)-(46,66)
(46,11)-(46,27)
(46,28)-(46,66)
(46,29)-(46,46)
(46,30)-(46,35)
(46,36)-(46,45)
(46,37)-(46,41)
(46,43)-(46,44)
(46,48)-(46,65)
(46,49)-(46,54)
(46,55)-(46,64)
(46,56)-(46,60)
(46,62)-(46,63)
(48,4)-(49,70)
(48,14)-(48,25)
(48,14)-(48,18)
(48,19)-(48,25)
(48,20)-(48,21)
(48,23)-(48,24)
(49,5)-(49,69)
(49,11)-(49,13)
(49,26)-(49,35)
(49,26)-(49,32)
(49,33)-(49,35)
(49,43)-(49,52)
(49,43)-(49,49)
(49,50)-(49,52)
(49,60)-(49,69)
(49,60)-(49,66)
(49,67)-(49,69)
*)
