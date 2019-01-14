
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

let rec build (rand,depth) =
  let r = ((rand 1), 6) in
  match r with
  | 1 -> buildSine (build (rand, (depth - 1)))
  | 2 -> buildCosine (build (rand, (depth - 1)))
  | 3 ->
      buildAverage ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
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

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildY ()
  | _ ->
      let r = rand (1, 6) in
      (match r with
       | 1 -> buildSine (build (rand, (depth - 1)))
       | 2 -> buildCosine (build (rand, (depth - 1)))
       | 3 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 4 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(21,15)-(33,67)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(21,15)-(33,67)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(21,15)-(33,67)
VarX
ConAppG Nothing Nothing

(21,15)-(33,67)
VarY
ConAppG Nothing Nothing

(22,2)-(33,67)
depth
VarG

(22,2)-(33,67)
buildX
VarG

(22,2)-(33,67)
buildY
VarG

(22,2)-(33,67)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(22,2)-(33,67)
buildY ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(22,2)-(33,67)
match depth with
| 0 -> buildX ()
| 1 -> buildY ()
| _ -> (let r =
          rand (1 , 6) in
        match r with
        | 1 -> buildSine (build (rand , depth - 1))
        | 2 -> buildCosine (build (rand , depth - 1))
        | 3 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
        | 4 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
        | 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1)))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(22,2)-(33,67)
()
ConAppG Nothing (Just (TApp "unit" []))

(22,2)-(33,67)
()
ConAppG Nothing (Just (TApp "unit" []))

(22,17)-(22,18)
(1 , 6)
TupleG (fromList [LitG])

*)
