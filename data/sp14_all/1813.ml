
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | AbsThresh of expr* expr* expr
  | ModThresh of expr* expr* expr;;

let buildAbsThresh (e1,e2,e3) = AbsThresh (e1, e2, e3);;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildModThresh (e1,e2,e3) = ModThresh (e1, e2, e3);;

let buildSine e = Sine e;;

let buildThresh (e1,e2,e3,e4) = Thresh (e1, e2, e3, e4);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, 99) in
  if depth = 0
  then (if r < 50 then buildX else buildY)
  else
    if r < 5
    then buildX ()
    else
      if r < 10
      then buildY ()
      else
        if r < 30
        then buildSine (build (rand, (depth - 1)))
        else
          if r < 50
          then buildCosine (build (rand, (depth - 1)))
          else
            if r < 60
            then
              buildAverage
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              if r < 70
              then
                buildTimes
                  ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
              else
                if r < 80
                then
                  buildThresh
                    ((build (rand, (depth - 1))),
                      (build (rand, (depth - 1))),
                      (build (rand, (depth - 1))),
                      (build (rand, (depth - 1))))
                else
                  if r < 90
                  then
                    buildAbsThresh
                      ((build (rand, (depth - 1))),
                        (build (rand, (depth - 1))),
                        (build (rand, (depth - 1))))
                  else
                    if r < 90
                    then
                      buildModThresh
                        ((build (rand, (depth - 1))),
                          (build (rand, (depth - 1))),
                          (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | AbsThresh of expr* expr* expr
  | ModThresh of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, 99) in
  if depth = 0 then (if r < 50 then buildX () else buildY ()) else buildY ();;

*)

(* changed spans
(34,24)-(34,30)
buildX ()
AppG (fromList [ConAppG Nothing])

(34,36)-(34,42)
buildY ()
AppG (fromList [ConAppG Nothing])

(36,5)-(78,55)
buildY ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(19,4)-(19,57)
(19,21)-(19,55)
(19,33)-(19,55)
(23,4)-(23,58)
(23,18)-(23,56)
(23,33)-(23,56)
(25,4)-(25,42)
(25,17)-(25,40)
(25,26)-(25,40)
(29,4)-(29,23)
(29,12)-(29,21)
(29,17)-(29,21)
(33,3)-(78,55)
(34,8)-(34,43)
(34,36)-(34,42)
(36,5)-(78,55)
(39,7)-(78,55)
(40,12)-(40,18)
(40,12)-(40,21)
(42,9)-(78,55)
(45,11)-(78,55)
(48,13)-(78,55)
(53,15)-(78,55)
(55,17)-(55,27)
(55,17)-(56,77)
(58,17)-(78,55)
(60,19)-(60,30)
(60,19)-(64,51)
(66,19)-(78,55)
(73,21)-(78,55)
(75,23)-(75,37)
(75,23)-(78,55)
(78,55)-(78,55)
*)
