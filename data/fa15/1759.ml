
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
  | 0 -> (match rand (0, 1) with | 0 -> VarX | 1 -> VarY)
  | n ->
      (match rand (0, 6) with
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
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1)))));;


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
  | 0 -> (match rand (0, 1) with | 0 -> VarX | 1 -> VarY)
  | n ->
      (match rand (0, 6) with
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
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(42,14)-(44,44)
(build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(17,4)-(17,70)
(17,18)-(17,68)
(41,12)-(41,23)
(41,12)-(44,44)
(42,14)-(44,44)
*)
