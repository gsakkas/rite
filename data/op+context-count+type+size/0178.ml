
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | DivideByOne of expr* expr* expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildDivideByOne (e1,e2,e3) = DivideByOne (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSquareRoot e = SquareRoot e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (0, 1) in match num with | 0 -> buildX () | 1 -> buildY ()
  else
    (let num = rand (0, 7) in
     match num with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 7 -> buildSquareRoot (build (rand, (depth - 1)))
     | 8 ->
         buildDivideByOne
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSquareRoot e = SquareRoot e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (0, 1) in match num with | 0 -> buildX () | 1 -> buildY ()
  else
    (let num = rand (0, 7) in
     match num with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 7 -> buildSquareRoot (build (rand, (depth - 1))));;

*)

(* changed spans
(27,23)-(27,58)
(27,35)-(27,58)
(27,48)-(27,50)
(27,52)-(27,54)
(27,56)-(27,58)
(47,6)-(66,38)
(54,14)-(54,37)
(54,43)-(54,66)
(57,14)-(57,37)
(57,43)-(57,66)
(64,10)-(66,38)
*)

(* type error slice
(23,4)-(23,46)
(23,19)-(23,43)
(23,37)-(23,39)
(23,41)-(23,43)
(25,4)-(25,31)
(25,17)-(25,29)
(25,28)-(25,29)
(27,4)-(27,61)
(27,23)-(27,58)
(27,48)-(27,50)
(27,52)-(27,54)
(27,56)-(27,58)
(29,4)-(29,27)
(29,15)-(29,25)
(29,24)-(29,25)
(31,4)-(31,39)
(31,21)-(31,37)
(31,36)-(31,37)
(33,4)-(33,70)
(33,18)-(33,67)
(33,47)-(33,48)
(33,50)-(33,51)
(33,53)-(33,59)
(33,61)-(33,67)
(35,4)-(35,42)
(35,17)-(35,39)
(35,33)-(35,35)
(35,37)-(35,39)
(37,4)-(37,23)
(37,12)-(37,21)
(39,4)-(39,23)
(39,12)-(39,21)
(41,16)-(66,38)
(42,6)-(42,11)
(42,6)-(42,15)
(44,5)-(44,78)
(44,5)-(44,78)
(44,15)-(44,19)
(44,15)-(44,25)
(44,30)-(44,78)
(44,30)-(44,78)
(44,36)-(44,39)
(44,52)-(44,58)
(44,52)-(44,61)
(44,69)-(44,75)
(44,69)-(44,78)
(48,13)-(48,19)
(48,13)-(48,22)
(49,13)-(49,19)
(49,13)-(49,22)
(50,13)-(50,22)
(50,13)-(50,47)
(50,24)-(50,29)
(50,24)-(50,47)
(51,13)-(51,24)
(51,13)-(51,49)
(53,10)-(53,22)
(53,10)-(54,66)
(56,10)-(56,20)
(56,10)-(57,66)
(59,10)-(59,21)
(59,10)-(61,38)
(60,14)-(60,20)
(60,14)-(60,23)
(60,14)-(61,38)
(60,27)-(60,33)
(60,27)-(60,36)
(62,13)-(62,28)
(62,13)-(62,53)
(64,10)-(64,26)
(64,10)-(66,38)
*)
