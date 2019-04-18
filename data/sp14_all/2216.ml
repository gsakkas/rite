
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
(27,7)-(39,25)
match rand (1 , 13) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildSine (build (rand , depth - 1))
| 4 -> buildCosine (build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildSine (build (rand , depth - 1))
| 7 -> buildCosine (build (rand , depth - 1))
| 8 -> buildSine (build (rand , depth - 1))
| 9 -> buildCosine (build (rand , depth - 1))
| 10 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 11 -> buildX ()
| 12 -> buildY ()
CaseG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(27,23)-(27,25)
13
LitG

(28,25)-(28,60)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(29,27)-(29,62)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(30,25)-(30,60)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(31,27)-(31,62)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(32,15)-(32,60)
buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(33,15)-(33,62)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(35,12)-(37,73)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(38,15)-(38,24)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(39,15)-(39,24)
buildCosine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

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
(15,18)-(15,68)
(15,39)-(15,68)
(15,61)-(15,67)
(17,4)-(17,23)
(17,12)-(17,21)
(17,17)-(17,21)
(23,4)-(39,27)
(23,16)-(39,25)
(24,3)-(39,25)
(25,10)-(25,68)
(25,41)-(25,47)
(25,41)-(25,50)
(28,15)-(28,24)
(28,15)-(28,60)
(28,25)-(28,60)
(28,32)-(28,59)
(28,33)-(28,38)
(29,15)-(29,26)
(29,15)-(29,62)
(29,27)-(29,62)
(30,15)-(30,24)
(30,15)-(30,60)
(30,25)-(30,60)
(31,15)-(31,26)
(31,15)-(31,62)
(31,27)-(31,62)
(32,15)-(32,24)
(32,15)-(32,60)
(32,25)-(32,60)
(33,15)-(33,26)
(33,15)-(33,62)
(33,27)-(33,62)
(35,12)-(35,23)
(35,12)-(37,73)
(36,14)-(37,73)
(37,45)-(37,72)
(37,46)-(37,51)
*)
