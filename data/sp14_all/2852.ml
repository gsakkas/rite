
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
             ((buildCosine (rand, (depth - 1))),
               (buildSine (build (rand, (depth - 1)))))
       | r when (r < 20) && (r > 10) ->
           buildThresh
             ((build (rand, (depth - 1))),
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
             ((buildCosine (build (rand, (depth - 1)))),
               (buildSine (build (rand, (depth - 1)))))
       | r when (r < 20) && (r > 10) ->
           buildThresh
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | r when (r < 25) && (r > 20) -> buildSine (build (rand, (depth - 1)))
       | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(33,28)-(33,47)
build (rand , depth - 1)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(15,4)-(15,31)
(15,17)-(15,29)
(15,21)-(15,29)
(15,28)-(15,29)
(33,15)-(33,48)
(33,16)-(33,27)
(33,28)-(33,47)
*)
