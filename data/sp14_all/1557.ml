
let rec build (rand,depth) =
  match rand depth with | (r,0) -> build (r, 0) | (r,d) -> (r, (d - 1));;


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
  match (rand, depth) with
  | (r,0) -> if (r (0, 1)) = 0 then buildX () else buildY ()
  | (r,depth) ->
      let r = rand (0, 7) in
      (match r with
       | 0 -> buildX ()
       | 1 -> buildY ()
       | 2 -> buildSine (build (rand, (depth - 1)))
       | 3 -> buildCosine (build (rand, (depth - 1)))
       | 4 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(3,3)-(3,72)
match (rand , depth) with
| (r , 0) -> if r (0 , 1) = 0
             then buildX ()
             else buildY ()
| (r , depth) -> (let r =
                    rand (0 , 7) in
                  match r with
                  | 0 -> buildX ()
                  | 1 -> buildY ()
                  | 2 -> buildSine (build (rand , depth - 1))
                  | 3 -> buildCosine (build (rand , depth - 1))
                  | 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
                  | 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
                  | _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1)))
CaseG (TupleG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [VarPatG]),Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG),(TuplePatG (fromList [VarPatG,LitPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(2,4)-(3,74)
(2,16)-(3,72)
(3,3)-(3,72)
(3,9)-(3,13)
(3,9)-(3,19)
(3,36)-(3,41)
(3,36)-(3,48)
(3,42)-(3,48)
(3,43)-(3,44)
*)
