
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
  match (rand, depth) with
  | (_,0) -> if (rand mod 2) == 0 then buildY () else buildX ()
  | (_,1) ->
      if (rand mod 3) == 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | (_,2) ->
      buildTimes
        (((build rand), (depth - 1)), (build ((rand + 1), (depth - 1))));;


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

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - 1)))
  | _ -> buildCosine (build (rand, (depth - 1)));;

*)

(* changed spans
(15,16)-(15,39)
(15,25)-(15,39)
(15,32)-(15,34)
(15,36)-(15,38)
(19,11)-(19,20)
(19,16)-(19,20)
(22,2)-(30,72)
(22,8)-(22,21)
(22,9)-(22,13)
(23,13)-(23,63)
(23,16)-(23,28)
(23,16)-(23,33)
(23,17)-(23,21)
(23,26)-(23,27)
(23,32)-(23,33)
(23,39)-(23,45)
(23,46)-(23,48)
(23,54)-(23,63)
(25,6)-(27,50)
(25,9)-(25,26)
(25,10)-(25,14)
(25,19)-(25,20)
(25,25)-(25,26)
*)

(* type error slice
(15,3)-(15,41)
(15,16)-(15,39)
(15,25)-(15,39)
(15,32)-(15,34)
(26,21)-(26,48)
(26,22)-(26,27)
(26,28)-(26,47)
(26,29)-(26,33)
(29,6)-(29,16)
(29,6)-(30,72)
(30,8)-(30,72)
(30,9)-(30,36)
(30,10)-(30,22)
(30,11)-(30,16)
(30,17)-(30,21)
*)
