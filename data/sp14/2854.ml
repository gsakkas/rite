
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 150) in
      (match r with
       | r when r < 5 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 10) && (r > 5) ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 25) && (r > 20) -> buildSine (build (rand, (depth - 1)))
       | r when (r > 25) && (r < 35) ->
           buildTimes (buildCosine (buildSine (build (rand, (depth - 1)))))
       | r when (r > 35) && (r < 40) ->
           buildCosine (buildSine (build (rand, (depth - 1))))
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (0, 150) in
      (match r with
       | r when r < 5 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 10) && (r > 5) ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 25) && (r > 20) -> buildSine (build (rand, (depth - 1)))
       | r when (r > 25) && (r < 35) ->
           buildTimes
             ((buildCosine (buildSine (build (rand, (depth - 1))))),
               (buildSine (build (rand, (depth - 1)))))
       | r when (r > 35) && (r < 40) ->
           buildCosine (buildSine (build (rand, (depth - 1))))
       | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(42,23)-(42,76)
(buildCosine (buildSine (build (rand , depth - 1))) , buildSine (build (rand , depth - 1)))
TupleG [AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(15,4)-(15,31)
(15,17)-(15,29)
(15,21)-(15,29)
(21,4)-(21,42)
(21,17)-(21,40)
(42,12)-(42,22)
(42,12)-(42,76)
(42,23)-(42,76)
(42,24)-(42,35)
*)
