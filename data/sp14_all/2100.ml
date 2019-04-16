
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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        (if depth = 0
         then buildX ()
         else
           ((build (rand, (depth - 1))),
             (if depth = 0 then buildY () else build (rand, (depth - 1)))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
  | 7 ->
      buildThresh
        ((build (rand, depth)), (build (rand, depth)), (build (rand, depth)),
          (build (rand, depth)));;

*)

(* changed spans
(36,9)-(40,76)
(if depth = 0
 then buildX ()
 else build (rand , depth - 1) , if depth = 0
                                 then buildY ()
                                 else build (rand , depth - 1))
TupleG (fromList [IteG EmptyG EmptyG EmptyG])

*)

(* type error slice
(30,17)-(30,77)
(30,36)-(30,42)
(30,36)-(30,45)
(30,51)-(30,56)
(30,51)-(30,76)
(36,9)-(40,76)
(37,15)-(37,21)
(37,15)-(37,24)
(39,12)-(40,75)
(40,14)-(40,74)
(40,48)-(40,53)
(40,48)-(40,73)
*)
