
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
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
                ((build (rand, (depth - 1))), (build (rand, (depth - 1))));;


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
(27,7)-(42,75)
buildX ()
AppG (fromList [ConAppG Nothing])

*)

(* type error slice
(17,4)-(17,42)
(17,17)-(17,40)
(17,26)-(17,40)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(24,3)-(42,75)
(25,10)-(25,60)
(25,51)-(25,57)
(25,51)-(25,60)
(27,7)-(42,75)
(28,7)-(42,75)
(31,9)-(42,75)
(34,11)-(42,75)
(39,13)-(42,75)
(41,15)-(41,25)
(41,15)-(42,75)
(42,75)-(42,75)
*)
