
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 3) with | 1 -> buildX () | _ -> buildY ())
  | _ ->
      (match rand (1, 10) with
       | 1 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 2 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 3 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 4 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 5 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 6 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 7 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 8 -> buildX ()
       | 9 -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 3) with | 1 -> buildX () | _ -> buildY ())
  | _ ->
      (match rand (1, 13) with
       | 1 -> buildSine (build (rand, (depth - 1)))
       | 2 -> buildCosine (build (rand, (depth - 1)))
       | 3 -> buildSine (build (rand, (depth - 1)))
       | 4 -> buildCosine (build (rand, (depth - 1)))
       | 5 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 6 -> buildSine (build (rand, (depth - 1)))
       | 7 -> buildCosine (build (rand, (depth - 1)))
       | 8 -> buildSine (build (rand, (depth - 1)))
       | 9 -> buildCosine (build (rand, (depth - 1)))
       | 10 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 11 -> buildX ()
       | 12 -> buildY ());;

*)

(* changed spans
(21,9)-(21,12)
(21,9)-(21,26)
(21,16)-(21,26)
(21,17)-(21,21)
(21,22)-(21,25)
(27,6)-(39,24)
(27,22)-(27,24)
(28,24)-(28,59)
(28,25)-(28,27)
(29,26)-(29,61)
(29,27)-(29,29)
(30,24)-(30,59)
(30,25)-(30,27)
(31,26)-(31,61)
(31,27)-(31,29)
(32,14)-(32,23)
(32,24)-(32,59)
(32,25)-(32,27)
(32,31)-(32,58)
(33,14)-(33,25)
(33,26)-(33,61)
(33,27)-(33,29)
(33,33)-(33,60)
(35,11)-(35,22)
(36,13)-(37,72)
(36,14)-(36,41)
(36,15)-(36,20)
(36,44)-(36,49)
(37,16)-(37,21)
(37,45)-(37,50)
(38,14)-(38,20)
(38,21)-(38,23)
(39,14)-(39,20)
(39,14)-(39,23)
(39,21)-(39,23)
*)

(* type error slice
(11,3)-(11,30)
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,3)-(15,69)
(15,17)-(15,67)
(15,38)-(15,67)
(15,60)-(15,66)
(17,3)-(17,22)
(17,11)-(17,20)
(17,16)-(17,20)
(23,3)-(39,26)
(23,15)-(39,24)
(24,2)-(39,24)
(25,9)-(25,67)
(25,40)-(25,46)
(25,40)-(25,49)
(28,14)-(28,23)
(28,14)-(28,59)
(28,24)-(28,59)
(28,24)-(28,59)
(28,31)-(28,58)
(28,32)-(28,37)
(29,14)-(29,25)
(29,14)-(29,61)
(29,26)-(29,61)
(30,14)-(30,23)
(30,14)-(30,59)
(30,24)-(30,59)
(31,14)-(31,25)
(31,14)-(31,61)
(31,26)-(31,61)
(32,14)-(32,23)
(32,14)-(32,59)
(32,24)-(32,59)
(33,14)-(33,25)
(33,14)-(33,61)
(33,26)-(33,61)
(35,11)-(35,22)
(35,11)-(37,72)
(36,13)-(37,72)
(37,44)-(37,71)
(37,45)-(37,50)
*)
