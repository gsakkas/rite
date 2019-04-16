
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
(22,3)-(33,68)
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
CaseG VarG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)])

*)

(* type error slice
(22,3)-(33,68)
(22,11)-(22,24)
(23,3)-(33,68)
(23,9)-(23,10)
*)
