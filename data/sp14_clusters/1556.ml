
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand depth with
  | (1,d) -> (d = (d - 1)) && (buildX ())
  | (2,d) -> (d = (d - 1)) && (buildY ());;


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
(11,11)-(11,20)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG [VarG,VarG])) Nothing) Nothing

(11,11)-(11,20)
fun e -> Cosine e
LamG (ConAppG (Just VarG) Nothing) Nothing

(11,11)-(11,20)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing) Nothing

(11,11)-(11,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG [VarG,VarG,VarG,VarG])) Nothing) Nothing

(11,11)-(11,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG [VarG,VarG])) Nothing) Nothing

(16,8)-(16,12)
(rand , depth)
TupleG [VarG,VarG]

(16,8)-(16,18)
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
CaseG (TupleG [EmptyG,EmptyG]) [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,LetG NonRec [EmptyG] EmptyG)]

(17,13)-(17,41)
if r (0 , 1) = 0
then buildX ()
else buildY ()
IteG (BopG EmptyG EmptyG) (AppG EmptyG [EmptyG]) (AppG EmptyG [EmptyG])

(17,19)-(17,20)
r (0 , 1)
AppG VarG [TupleG [EmptyG,EmptyG]]

(17,23)-(17,24)
(0 , 1)
TupleG [LitG,LitG]

*)
