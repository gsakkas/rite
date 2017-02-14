
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
  | 0 -> if ((rand ()) mod 2) = 0 then buildX () else buildY ()
  | _ ->
      (match rand with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 3 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
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
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(27,12)-(27,29)
(27,19)-(27,21)
(27,27)-(27,28)
(27,39)-(27,48)
(29,13)-(29,17)
(30,14)-(30,51)
(41,59)-(41,64)
(41,67)-(41,68)
*)

(* type error slice
(27,13)-(27,22)
(27,14)-(27,18)
(29,6)-(41,73)
(29,6)-(41,73)
(29,6)-(41,73)
(29,6)-(41,73)
(29,6)-(41,73)
(29,6)-(41,73)
(29,6)-(41,73)
(29,6)-(41,73)
(29,13)-(29,17)
*)
