
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n mod 5) = 0 -> buildSine (build (x, (n - 1)))
  | (x,n) when (n mod 5) = 4 -> buildCosine (build (x, (n - 1)));;


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
  match ((rand (243, 98723)), depth) with
  | (x,0) when (x mod 2) = 0 -> buildY ()
  | (x,0) when (x mod 2) = 1 -> buildX ()
  | (x,n) when (n > 0) && ((x mod 5) = 0) ->
      buildSine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 1) ->
      buildCosine (build (rand, (n - 1)))
  | (x,n) when (n > 0) && ((x mod 5) = 2) ->
      buildAverage ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 3) ->
      buildTimes ((build (rand, (n - 1))), (build (rand, (n - 1))))
  | (x,n) when (n > 0) && ((x mod 5) = 4) ->
      buildThresh
        ((build (rand, (n - 1))), (build (rand, (n - 1))),
          (build (rand, (n - 1))), (build (rand, (n - 1))));;

*)

(* changed spans
(20,3)-(24,65)
match (rand (243 , 98723) , depth) with
| (x , 0) when (x mod 2) = 0 -> buildY ()
| (x , 0) when (x mod 2) = 1 -> buildX ()
| (x , n) when (n > 0) && ((x mod 5) = 0) -> buildSine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 1) -> buildCosine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 2) -> buildAverage (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 3) -> buildTimes (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 4) -> buildThresh (build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1))
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG])),(TuplePatG (fromList [VarPatG,LitPatG]),Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])

(23,16)-(23,29)
(n > 0) && ((x mod 5) = 0)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(24,16)-(24,29)
(n > 0) && ((x mod 5) = 1)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

*)

(* type error slice
(19,4)-(24,67)
(19,16)-(24,65)
(20,3)-(24,65)
(20,9)-(20,37)
(20,10)-(20,29)
(20,11)-(20,15)
(23,43)-(23,63)
(23,44)-(23,49)
(23,50)-(23,62)
(23,51)-(23,52)
*)
