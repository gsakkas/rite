
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | r when r < 5 ->
           ((buildAverage (build (rand, (depth - 1)))),
             (build (rand, (depth - 1))))
       | r when (r < 10) && (r > 5) ->
           buildThresh
             ((buildCosine (build (rand, (depth - 1)))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 25) && (r > 20) -> buildSine (build (rand, (depth - 1)))
       | _ -> buildCosine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | r when r < 5 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 10) && (r > 5) ->
           buildThresh
             ((buildCosine (build (rand, (depth - 1)))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 25) && (r > 20) -> buildSine (build (rand, (depth - 1)))
       | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(32,12)-(33,42)
buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(13,4)-(13,46)
(13,19)-(13,44)
(15,4)-(15,31)
(15,17)-(15,29)
(15,21)-(15,29)
(15,28)-(15,29)
(17,4)-(17,27)
(17,15)-(17,25)
(17,19)-(17,25)
(17,24)-(17,25)
(19,4)-(19,70)
(19,18)-(19,68)
(19,39)-(19,68)
(19,61)-(19,67)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(25,4)-(40,57)
(25,16)-(40,55)
(26,3)-(40,55)
(27,10)-(27,60)
(27,51)-(27,57)
(27,51)-(27,60)
(29,7)-(40,55)
(30,7)-(40,55)
(32,12)-(33,42)
(32,13)-(32,55)
(32,14)-(32,26)
(32,27)-(32,54)
(32,28)-(32,33)
(35,12)-(35,23)
(35,12)-(38,73)
(36,14)-(38,73)
(36,15)-(36,56)
(36,16)-(36,27)
(36,28)-(36,55)
(36,29)-(36,34)
(37,16)-(37,57)
(37,17)-(37,28)
(37,29)-(37,56)
(37,30)-(37,35)
(38,45)-(38,72)
(38,46)-(38,51)
(39,41)-(39,50)
(39,41)-(39,78)
(39,51)-(39,78)
(39,52)-(39,57)
(40,15)-(40,26)
(40,15)-(40,54)
(40,27)-(40,54)
(40,28)-(40,33)
*)
