
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
  match rand (1, 7) with
  | _ -> rand (1, 7)
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;


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
  match rand (1, 7) with
  | 1 -> buildX ()
  | 2 -> buildY ()
  | 3 ->
      buildSine (if depth = 0 then buildX () else build (rand, (depth - 1)))
  | 4 ->
      buildCosine
        (if depth = 0 then buildY () else build (rand, (depth - 1)))
  | 5 ->
      buildAverage
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 6 ->
      buildTimes
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))))
  | 7 ->
      buildThresh
        ((if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))),
          (if depth = 0 then buildX () else build (rand, (depth - 1))),
          (if depth = 0 then buildY () else build (rand, (depth - 1))));;

*)

(* changed spans
(26,3)-(48,72)
match rand (1 , 7) with
| 1 -> buildX ()
| 2 -> buildY ()
| 3 -> buildSine (if depth = 0
                  then buildX ()
                  else build (rand , depth - 1))
| 4 -> buildCosine (if depth = 0
                    then buildY ()
                    else build (rand , depth - 1))
| 5 -> buildAverage (if depth = 0
                     then buildX ()
                     else build (rand , depth - 1) , if depth = 0
                                                     then buildY ()
                                                     else build (rand , depth - 1))
| 6 -> buildTimes (if depth = 0
                   then buildX ()
                   else build (rand , depth - 1) , if depth = 0
                                                   then buildY ()
                                                   else build (rand , depth - 1))
| 7 -> buildThresh (if depth = 0
                    then buildX ()
                    else build (rand , depth - 1) , if depth = 0
                                                    then buildY ()
                                                    else build (rand , depth - 1) , if depth = 0
                                                                                    then buildX ()
                                                                                    else build (rand , depth - 1) , if depth = 0
                                                                                                                    then buildY ()
                                                                                                                    else build (rand , depth - 1))
CaseG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

(27,10)-(27,21)
buildX ()
AppG (fromList [ConAppG Nothing])

(28,10)-(28,19)
buildY ()
AppG (fromList [ConAppG Nothing])

(29,10)-(29,19)
buildSine (if depth = 0
           then buildX ()
           else build (rand , depth - 1))
AppG (fromList [IteG EmptyG EmptyG EmptyG])

(31,7)-(31,77)
buildCosine (if depth = 0
             then buildY ()
             else build (rand , depth - 1))
AppG (fromList [IteG EmptyG EmptyG EmptyG])

(33,7)-(34,69)
buildAverage (if depth = 0
              then buildX ()
              else build (rand , depth - 1) , if depth = 0
                                              then buildY ()
                                              else build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(36,7)-(38,72)
buildTimes (if depth = 0
            then buildX ()
            else build (rand , depth - 1) , if depth = 0
                                            then buildY ()
                                            else build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(40,7)-(42,72)
buildThresh (if depth = 0
             then buildX ()
             else build (rand , depth - 1) , if depth = 0
                                             then buildY ()
                                             else build (rand , depth - 1) , if depth = 0
                                                                             then buildX ()
                                                                             else build (rand , depth - 1) , if depth = 0
                                                                                                             then buildY ()
                                                                                                             else build (rand , depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(11,28)-(11,44)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(17,4)-(17,70)
(17,18)-(17,68)
(17,39)-(17,68)
(19,4)-(19,42)
(19,17)-(19,40)
(19,26)-(19,40)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(25,4)-(48,74)
(25,16)-(48,72)
(26,3)-(48,72)
(26,9)-(26,13)
(26,9)-(26,20)
(27,10)-(27,14)
(27,10)-(27,21)
(28,10)-(28,16)
(28,10)-(28,19)
(29,10)-(29,16)
(29,10)-(29,19)
(31,7)-(31,16)
(31,7)-(31,77)
(31,17)-(31,77)
(31,36)-(31,42)
(31,36)-(31,45)
(31,51)-(31,56)
(31,51)-(31,76)
(33,7)-(33,18)
(33,7)-(34,69)
(36,7)-(36,19)
(36,7)-(38,72)
(40,7)-(40,17)
(40,7)-(42,72)
(44,7)-(44,18)
(44,7)-(48,72)
*)
