
let rec build (rand,depth) = match depth with | 0 -> rand (0, 1) | _ -> rand;;


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
  | 0 ->
      let x = rand (0, 1) in (match x with | 0 -> buildX () | 1 -> buildY ())
  | _ ->
      let x = rand (0, 6) in
      (match x with
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
(2,15)-(2,76)
(2,53)-(2,64)
(2,72)-(2,76)
*)

(* type error slice
(2,29)-(2,76)
(2,53)-(2,57)
(2,53)-(2,64)
(2,72)-(2,76)
*)

(* all spans
(2,15)-(2,76)
(2,29)-(2,76)
(2,35)-(2,40)
(2,53)-(2,64)
(2,53)-(2,57)
(2,58)-(2,64)
(2,59)-(2,60)
(2,62)-(2,63)
(2,72)-(2,76)
*)
