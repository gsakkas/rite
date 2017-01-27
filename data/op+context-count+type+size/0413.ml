
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesModOne of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTan e = Tan e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildTimesMod (e1,e2,e3) = TimesMod (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 0 ->
        buildTimesMod
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
    | 1 -> buildTan (mod_float (build (rand, (depth - 1))) 1.0)
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> buildY ()
  else
    (match rand (0, 1) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | _ -> buildX ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | SineSq of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesModOne of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildSineSq e = SineSq e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (0, 6) with
    | 1 -> buildSineSq (build (rand, (depth - 1)))
    | 2 -> buildSine (build (rand, (depth - 1)))
    | 3 -> buildCosine (build (rand, (depth - 1)))
    | 4 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 5 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | _ -> buildY ()
  else
    (match rand (0, 1) with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | _ -> buildX ());;

*)

(* changed spans
(30,18)-(30,23)
(36,20)-(36,52)
(36,32)-(36,52)
(36,42)-(36,44)
(36,46)-(36,48)
(36,50)-(36,52)
(45,5)-(62,21)
(47,9)-(47,22)
(48,13)-(49,37)
(48,42)-(48,47)
(48,49)-(48,53)
(48,49)-(48,65)
(48,56)-(48,61)
(48,56)-(48,65)
(48,64)-(48,65)
(50,12)-(50,20)
(50,22)-(50,31)
(50,22)-(50,63)
(50,60)-(50,63)
(51,12)-(51,21)
(51,23)-(51,46)
(52,12)-(52,23)
(52,25)-(52,48)
(54,9)-(54,21)
(55,13)-(55,36)
(55,13)-(55,65)
(57,9)-(57,19)
(57,22)-(57,45)
(57,22)-(57,74)
(59,9)-(59,20)
(60,13)-(60,36)
(60,13)-(61,66)
(61,43)-(61,66)
(62,12)-(62,21)
(64,6)-(67,22)
*)

(* type error slice
(45,11)-(45,15)
(45,11)-(45,21)
(45,17)-(45,18)
(45,17)-(45,21)
(45,20)-(45,21)
(48,13)-(48,18)
(48,13)-(48,36)
(48,20)-(48,24)
(48,20)-(48,36)
(48,27)-(48,36)
(50,22)-(50,31)
(50,22)-(50,63)
(50,33)-(50,38)
(50,33)-(50,56)
(50,40)-(50,44)
(50,40)-(50,56)
(50,47)-(50,56)
(50,60)-(50,63)
*)
