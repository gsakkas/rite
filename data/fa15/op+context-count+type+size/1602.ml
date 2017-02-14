
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
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | depth ->
      (match rand with
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
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | depth ->
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
(29,14)-(29,18)
(30,15)-(30,49)
(41,60)-(41,65)
(41,68)-(41,69)
*)

(* type error slice
(27,14)-(27,18)
(27,14)-(27,24)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,8)-(41,69)
(29,14)-(29,18)
*)
