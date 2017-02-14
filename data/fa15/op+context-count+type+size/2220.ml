
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n mod 5) = 0 -> buildSine (build (x, (n - 1)))
  | (x,n) when (n mod 5) = 4 -> buildCosine (build (x, (n - 1)));;


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
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n > 0) && ((x mod 5) = 0) ->
      buildSine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 1) ->
      buildCosine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 2) ->
      buildAverage ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 3) ->
      buildTimes ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 4) ->
      buildThresh
        ((build (rand, (n - 1))), (build (rand, (n - 1))),
          (build (rand, (n - 1))), (build (rand, (n - 1))));;

*)

(* changed spans
(11,17)-(11,29)
(15,12)-(15,21)
(20,3)-(24,62)
(23,51)-(23,52)
(23,55)-(23,56)
(23,55)-(23,60)
(23,59)-(23,60)
(24,33)-(24,44)
(24,46)-(24,51)
(24,53)-(24,54)
(24,53)-(24,62)
(24,57)-(24,58)
(24,57)-(24,62)
(24,61)-(24,62)
*)

(* type error slice
(19,4)-(24,67)
(19,16)-(24,62)
(20,3)-(24,62)
(20,11)-(20,15)
(20,11)-(20,27)
(20,11)-(20,36)
(23,44)-(23,49)
(23,44)-(23,60)
(23,51)-(23,52)
(23,51)-(23,60)
*)
