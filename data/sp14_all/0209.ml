
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
      let temp = (rand (0, 1)) = 0 in if temp then buildX () else buildY ()
  | _ ->
      let y = rand (2, 6) in
      if y = 2
      then buildSine (build (rand, (depth - 1)))
      else
        if y = 3
        then buildCosine (build (rand, (depth - 1)))
        else
          if y = 4
          then
            buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
          else
            if y = 5
            then
              buildTimes
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
            else
              if y = 6
              then
                buildThresh
                  ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                    (build (rand, (depth - 1))), (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ -> buildX ();;

*)

(* changed spans
(28,7)-(28,76)
if rand (0 , 1) = 0
then buildX ()
else buildY ()
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(30,7)-(51,78)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(17,4)-(17,70)
(17,18)-(17,68)
(17,39)-(17,68)
(19,4)-(19,42)
(19,17)-(19,40)
(19,26)-(19,40)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(26,3)-(51,78)
(28,7)-(28,76)
(28,39)-(28,76)
(28,67)-(28,73)
(28,67)-(28,76)
(30,7)-(51,78)
(31,7)-(51,78)
(34,9)-(51,78)
(37,11)-(51,78)
(42,13)-(51,78)
(44,15)-(44,25)
(44,15)-(45,75)
(47,15)-(51,78)
(49,17)-(49,28)
(49,17)-(51,78)
(51,78)-(51,78)
*)
