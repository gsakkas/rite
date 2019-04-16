
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
  let r = rand (0, 11) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r <= 2
      then buildSine (build (rand, (d - 1)))
      else
        if r <= 9
        then
          (match r with
           | 3 ->
               buildAverage
                 ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 4 ->
               buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 5 ->
               buildThresh
                 ((build (rand, (d - 1))), (build (rand, (d - 1))),
                   (build (rand, (d - 1))), (build (rand, (d - 1))))
           | 6 -> 0.
           | 7 -> 0.)
        else buildCosine (build (rand, (d - 1)));;


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
  let r = rand (0, 11) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r <= 2
      then buildSine (build (rand, (d - 1)))
      else
        if r <= 9
        then
          (match r with
           | 3 ->
               buildAverage
                 ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 4 ->
               buildTimes ((build (rand, (d - 1))), (build (rand, (d - 1))))
           | 5 ->
               buildThresh
                 ((build (rand, (d - 1))), (build (rand, (d - 1))),
                   (build (rand, (d - 1))), (build (rand, (d - 1)))))
        else buildCosine (build (rand, (d - 1)));;

*)

(* changed spans
(35,11)-(46,22)
match r with
| 3 -> buildAverage (build (rand , d - 1) , build (rand , d - 1))
| 4 -> buildTimes (build (rand , d - 1) , build (rand , d - 1))
| 5 -> buildThresh (build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1))
CaseG VarG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(35,11)-(46,22)
(37,16)-(37,28)
(37,16)-(38,68)
(45,19)-(45,21)
(46,19)-(46,21)
*)
