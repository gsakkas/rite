
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
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 -> buildAverage (build (rand, (depth - 1)))
       | 3 -> buildTimes (build (rand, (depth - 1)))
       | 4 -> buildThresh (build (rand, (depth - 1))));;


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
  | 0 -> (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 3 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(32,28)-(32,55)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(33,26)-(33,53)
(build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(34,27)-(34,54)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,68)
(19,4)-(19,42)
(19,17)-(19,40)
(30,15)-(30,24)
(30,15)-(30,52)
(30,25)-(30,52)
(30,26)-(30,31)
(32,15)-(32,27)
(32,15)-(32,55)
(32,28)-(32,55)
(32,29)-(32,34)
(33,15)-(33,25)
(33,15)-(33,53)
(33,26)-(33,53)
(33,27)-(33,32)
(34,15)-(34,26)
(34,15)-(34,54)
(34,27)-(34,54)
(34,28)-(34,33)
*)
