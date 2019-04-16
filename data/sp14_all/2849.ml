
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
(19,10)-(19,16)
buildX ()
AppG (fromList [ConAppG Nothing])

(20,10)-(20,45)
buildSine (build (rand , depth - (depth - 1)))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(13,4)-(13,42)
(13,17)-(13,40)
(13,26)-(13,40)
(13,37)-(13,39)
(15,4)-(15,23)
(15,12)-(15,21)
(18,3)-(24,49)
(19,10)-(19,16)
(20,10)-(20,15)
(20,10)-(20,45)
(22,7)-(22,17)
(22,7)-(24,49)
(23,9)-(24,49)
(24,11)-(24,48)
(24,12)-(24,17)
*)
