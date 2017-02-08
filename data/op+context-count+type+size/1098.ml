
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
(15,17)-(15,39)
(15,26)-(15,39)
(15,33)-(15,35)
(15,37)-(15,39)
(19,12)-(19,21)
(19,17)-(19,21)
(22,3)-(30,69)
(22,10)-(22,14)
(22,10)-(22,21)
(23,14)-(23,64)
(23,18)-(23,22)
(23,18)-(23,28)
(23,18)-(23,34)
(23,27)-(23,28)
(23,33)-(23,34)
(23,40)-(23,46)
(23,47)-(23,49)
(23,55)-(23,64)
(25,7)-(27,48)
(25,11)-(25,27)
(27,12)-(27,48)
(29,7)-(30,69)
*)

(* type error slice
(15,4)-(15,42)
(15,17)-(15,39)
(15,26)-(15,39)
(15,33)-(15,35)
(26,23)-(26,28)
(26,23)-(26,46)
(26,30)-(26,34)
(26,30)-(26,46)
(29,7)-(29,17)
(29,7)-(30,69)
(30,12)-(30,17)
(30,12)-(30,22)
(30,12)-(30,35)
(30,12)-(30,69)
(30,18)-(30,22)
*)
