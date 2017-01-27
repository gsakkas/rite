
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
(21,10)-(21,13)
(21,10)-(21,26)
(21,18)-(21,22)
(21,18)-(21,26)
(21,23)-(21,26)
(27,8)-(39,24)
(27,23)-(27,25)
(28,26)-(28,28)
(28,26)-(28,56)
(29,28)-(29,30)
(29,28)-(29,58)
(30,26)-(30,28)
(30,26)-(30,56)
(31,28)-(31,30)
(31,28)-(31,58)
(32,15)-(32,24)
(32,26)-(32,28)
(32,26)-(32,56)
(32,33)-(32,56)
(33,15)-(33,26)
(33,28)-(33,30)
(33,28)-(33,58)
(33,35)-(33,58)
(35,12)-(35,23)
(36,16)-(36,21)
(36,16)-(36,39)
(36,16)-(37,69)
(36,45)-(36,50)
(37,17)-(37,22)
(37,46)-(37,51)
(38,15)-(38,21)
(38,22)-(38,24)
(39,15)-(39,21)
(39,15)-(39,24)
(39,22)-(39,24)
*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(11,21)-(11,29)
(11,28)-(11,29)
(13,4)-(13,27)
(13,15)-(13,25)
(13,19)-(13,25)
(13,24)-(13,25)
(15,4)-(15,70)
(15,18)-(15,67)
(15,39)-(15,67)
(15,47)-(15,48)
(15,50)-(15,51)
(15,53)-(15,59)
(15,61)-(15,67)
(17,4)-(17,23)
(17,12)-(17,21)
(17,17)-(17,21)
(23,4)-(39,27)
(23,16)-(39,24)
(24,3)-(39,24)
(25,11)-(25,67)
(25,17)-(25,21)
(25,17)-(25,27)
(25,23)-(25,24)
(25,23)-(25,27)
(25,26)-(25,27)
(25,41)-(25,47)
(25,41)-(25,50)
(25,48)-(25,50)
(28,15)-(28,24)
(28,15)-(28,56)
(28,26)-(28,56)
(28,33)-(28,38)
(28,33)-(28,56)
(28,40)-(28,44)
(28,40)-(28,56)
(28,47)-(28,52)
(28,47)-(28,56)
(29,15)-(29,26)
(29,15)-(29,58)
(29,28)-(29,58)
(30,15)-(30,24)
(30,15)-(30,56)
(30,26)-(30,56)
(31,15)-(31,26)
(31,15)-(31,58)
(31,28)-(31,58)
(32,15)-(32,24)
(32,15)-(32,56)
(32,26)-(32,56)
(33,15)-(33,26)
(33,15)-(33,58)
(33,28)-(33,58)
(35,12)-(35,23)
(35,12)-(37,69)
(36,16)-(36,21)
(36,16)-(36,39)
(36,16)-(37,69)
(36,23)-(36,27)
(36,23)-(36,39)
(36,30)-(36,39)
(36,45)-(36,50)
(36,45)-(36,68)
(36,52)-(36,56)
(36,52)-(36,68)
(36,59)-(36,68)
(37,17)-(37,22)
(37,17)-(37,40)
(37,24)-(37,28)
(37,24)-(37,40)
(37,31)-(37,40)
(37,46)-(37,51)
(37,46)-(37,69)
(37,53)-(37,57)
(37,53)-(37,69)
(37,60)-(37,69)
*)
