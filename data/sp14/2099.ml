
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | _ ->
      buildTimes
        ((buildCosine (buildSine (buildX ()))),
          (buildCosine (buildSine (buildX ()))))
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildSine ()
  | 4 -> buildSine (buildX ())
  | 5 -> buildSine (buildX ())
  | 6 -> buildSine (buildX ())
  | 7 -> buildSine (buildX ());;


(* fix

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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (1, 7) with
  | _ ->
      buildTimes
        ((buildCosine (buildSine (buildX ()))),
          (buildCosine (buildSine (buildX ()))))
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 -> buildSine (buildX ())
  | 4 -> buildSine (buildX ())
  | 5 -> buildSine (buildX ())
  | 6 -> buildSine (buildX ())
  | 7 -> buildSine (buildX ());;

*)

(* changed spans
(29,19)-(29,21)
*)

(* type error slice
(13,3)-(13,26)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(29,9)-(29,18)
(29,9)-(29,21)
(29,19)-(29,21)
*)

(* all spans
(11,16)-(11,28)
(11,20)-(11,28)
(11,27)-(11,28)
(13,14)-(13,24)
(13,18)-(13,24)
(13,23)-(13,24)
(15,16)-(15,39)
(15,25)-(15,39)
(15,32)-(15,34)
(15,36)-(15,38)
(17,11)-(17,20)
(17,16)-(17,20)
(19,11)-(19,20)
(19,16)-(19,20)
(21,15)-(33,30)
(22,2)-(33,30)
(22,8)-(22,19)
(22,8)-(22,12)
(22,13)-(22,19)
(22,14)-(22,15)
(22,17)-(22,18)
(24,6)-(26,48)
(24,6)-(24,16)
(25,8)-(26,48)
(25,9)-(25,46)
(25,10)-(25,21)
(25,22)-(25,45)
(25,23)-(25,32)
(25,33)-(25,44)
(25,34)-(25,40)
(25,41)-(25,43)
(26,10)-(26,47)
(26,11)-(26,22)
(26,23)-(26,46)
(26,24)-(26,33)
(26,34)-(26,45)
(26,35)-(26,41)
(26,42)-(26,44)
(27,9)-(27,18)
(27,9)-(27,15)
(27,16)-(27,18)
(28,9)-(28,18)
(28,9)-(28,15)
(28,16)-(28,18)
(29,9)-(29,21)
(29,9)-(29,18)
(29,19)-(29,21)
(30,9)-(30,30)
(30,9)-(30,18)
(30,19)-(30,30)
(30,20)-(30,26)
(30,27)-(30,29)
(31,9)-(31,30)
(31,9)-(31,18)
(31,19)-(31,30)
(31,20)-(31,26)
(31,27)-(31,29)
(32,9)-(32,30)
(32,9)-(32,18)
(32,19)-(32,30)
(32,20)-(32,26)
(32,27)-(32,29)
(33,9)-(33,30)
(33,9)-(33,18)
(33,19)-(33,30)
(33,20)-(33,26)
(33,27)-(33,29)
*)
