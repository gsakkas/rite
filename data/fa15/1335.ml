
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    match rand (0, 1) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ();;


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
  if depth = 0
  then
    match rand (0, 1) with | 0 -> buildX () | 1 -> buildY () | _ -> buildX ()
  else
    (match rand (0, 7) with
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
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ -> buildX ());;

*)

(* changed spans
(11,11)-(11,20)
(16,2)-(18,77)
*)

(* type error slice
(11,3)-(11,22)
(11,11)-(11,20)
(11,16)-(11,20)
(16,2)-(18,77)
(18,4)-(18,77)
(18,34)-(18,40)
(18,34)-(18,43)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(18,77)
(16,2)-(18,77)
(16,5)-(16,14)
(16,5)-(16,10)
(16,13)-(16,14)
(18,4)-(18,77)
(18,10)-(18,21)
(18,10)-(18,14)
(18,15)-(18,21)
(18,16)-(18,17)
(18,19)-(18,20)
(18,34)-(18,43)
(18,34)-(18,40)
(18,41)-(18,43)
(18,51)-(18,60)
(18,51)-(18,57)
(18,58)-(18,60)
(18,68)-(18,77)
(18,68)-(18,74)
(18,75)-(18,77)
*)
