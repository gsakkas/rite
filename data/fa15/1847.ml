
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
(11,16)-(11,28)
(15,11)-(15,20)
(20,2)-(24,64)
(22,32)-(22,38)
(23,50)-(23,51)
(24,52)-(24,53)
*)

(* type error slice
(19,3)-(24,66)
(19,15)-(24,64)
(20,2)-(24,64)
(20,8)-(20,36)
(20,9)-(20,28)
(20,10)-(20,14)
(23,42)-(23,62)
(23,43)-(23,48)
(23,49)-(23,61)
(23,50)-(23,51)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,11)-(15,20)
(15,16)-(15,20)
(17,11)-(17,20)
(17,16)-(17,20)
(19,15)-(24,64)
(20,2)-(24,64)
(20,8)-(20,36)
(20,9)-(20,28)
(20,10)-(20,14)
(20,15)-(20,27)
(20,16)-(20,19)
(20,21)-(20,26)
(20,30)-(20,35)
(21,15)-(21,28)
(21,15)-(21,24)
(21,16)-(21,17)
(21,22)-(21,23)
(21,27)-(21,28)
(22,15)-(22,28)
(22,15)-(22,24)
(22,16)-(22,17)
(22,22)-(22,23)
(22,27)-(22,28)
(23,15)-(23,28)
(23,15)-(23,24)
(23,16)-(23,17)
(23,22)-(23,23)
(23,27)-(23,28)
(24,15)-(24,28)
(24,15)-(24,24)
(24,16)-(24,17)
(24,22)-(24,23)
(24,27)-(24,28)
(21,32)-(21,41)
(21,32)-(21,38)
(21,39)-(21,41)
(22,32)-(22,41)
(22,32)-(22,38)
(22,39)-(22,41)
(23,32)-(23,62)
(23,32)-(23,41)
(23,42)-(23,62)
(23,43)-(23,48)
(23,49)-(23,61)
(23,50)-(23,51)
(23,53)-(23,60)
(23,54)-(23,55)
(23,58)-(23,59)
(24,32)-(24,64)
(24,32)-(24,43)
(24,44)-(24,64)
(24,45)-(24,50)
(24,51)-(24,63)
(24,52)-(24,53)
(24,55)-(24,62)
(24,56)-(24,57)
(24,60)-(24,61)
*)
