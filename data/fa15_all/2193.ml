
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (e1,e2,e3) = Darius (e1, e2, e3);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match ((rand (2, 6)), depth) with
  | (c,0) -> if c > 3 then buildX () else buildY ()
  | (2,_) -> buildSine (build (rand, (depth - 1)))
  | (3,_) -> buildCosine (build (rand, (depth - 1)))
  | (4,_) ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | (5,_) ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | (6,_) ->
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
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildDarius (e1,e2,e3) = Darius (e1, e2, e3);;

let buildMirana e = Mirana e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match ((rand (2, 8)), depth) with
  | (c,0) -> if c > 3 then buildX () else buildY ()
  | (2,_) -> buildSine (build (rand, (depth - 1)))
  | (3,_) -> buildCosine (build (rand, (depth - 1)))
  | (4,_) ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | (5,_) ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | (6,_) ->
      buildThresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | (7,_) -> buildMirana (build (rand, (depth - 1)))
  | (8,_) ->
      buildDarius
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))));;

*)

(* changed spans
(19,18)-(19,49)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (TuplePatG (fromList [VarPatG])) (ConAppG (Just EmptyG))

(28,3)-(39,68)
match (rand (2 , 8) , depth) with
| (c , 0) -> if c > 3
             then buildX ()
             else buildY ()
| (2 , _) -> buildSine (build (rand , depth - 1))
| (3 , _) -> buildCosine (build (rand , depth - 1))
| (4 , _) -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| (5 , _) -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| (6 , _) -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| (7 , _) -> buildMirana (build (rand , depth - 1))
| (8 , _) -> buildDarius (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (fromList [(TuplePatG (fromList [VarPatG,LitPatG]),Nothing,IteG EmptyG EmptyG EmptyG),(TuplePatG (fromList [LitPatG,WildPatG]),Nothing,AppG (fromList [EmptyG]))])

(28,20)-(28,21)
8
LitG

*)

(* type error slice
(19,4)-(19,51)
(19,18)-(19,49)
(37,7)-(37,18)
(37,7)-(39,68)
(38,9)-(39,68)
*)
