
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX
  | 1 -> build (rand, (depth - (depth - 1)))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - (depth - 1))))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;

*)

(* changed spans
(13,16)-(13,39)
(19,9)-(19,15)
(20,9)-(20,14)
(20,9)-(20,44)
*)

(* type error slice
(13,3)-(13,41)
(13,16)-(13,39)
(13,25)-(13,39)
(13,36)-(13,38)
(15,3)-(15,22)
(15,11)-(15,20)
(18,2)-(24,48)
(19,9)-(19,15)
(20,9)-(20,14)
(20,9)-(20,44)
(22,6)-(22,16)
(22,6)-(24,48)
(23,8)-(24,48)
(24,10)-(24,47)
(24,11)-(24,16)
*)

(* all spans
(13,16)-(13,39)
(13,25)-(13,39)
(13,32)-(13,34)
(13,36)-(13,38)
(15,11)-(15,20)
(15,16)-(15,20)
(17,15)-(24,48)
(18,2)-(24,48)
(18,8)-(18,13)
(19,9)-(19,15)
(20,9)-(20,44)
(20,9)-(20,14)
(20,15)-(20,44)
(20,16)-(20,20)
(20,22)-(20,43)
(20,23)-(20,28)
(20,31)-(20,42)
(20,32)-(20,37)
(20,40)-(20,41)
(22,6)-(24,48)
(22,6)-(22,16)
(23,8)-(24,48)
(23,9)-(23,46)
(23,10)-(23,15)
(23,16)-(23,45)
(23,17)-(23,21)
(23,23)-(23,44)
(23,24)-(23,29)
(23,32)-(23,43)
(23,33)-(23,38)
(23,41)-(23,42)
(24,10)-(24,47)
(24,11)-(24,16)
(24,17)-(24,46)
(24,18)-(24,22)
(24,24)-(24,45)
(24,25)-(24,30)
(24,33)-(24,44)
(24,34)-(24,39)
(24,42)-(24,43)
*)
