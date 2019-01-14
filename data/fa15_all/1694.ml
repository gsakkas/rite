
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> (buildX ()) || (buildY ())
  | _ ->
      (buildSine (build (rand, (depth - 1)))) ||
        ((buildCosine (build (rand, (depth - 1)))) ||
           (buildAverage
              ((build (rand, (depth - 1))), (build (rand, (depth - 1))))));;


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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      (match rand (0, 4) with
       | 0 -> buildSine (build (rand, (depth - 1)))
       | 1 -> buildCosine (build (rand, (depth - 1)))
       | 2 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 3 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(17,11)-(17,20)
a
VarG

(17,11)-(17,20)
b
VarG

(17,11)-(17,20)
a_less
VarG

(17,11)-(17,20)
b_less
VarG

(17,11)-(17,20)
e1
VarG

(17,11)-(17,20)
e2
VarG

(17,11)-(17,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(17,11)-(17,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(17,11)-(17,20)
Thresh (a , b , a_less , b_less)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(17,11)-(17,20)
Times (e1 , e2)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(23,9)-(23,20)
rand (0 , 1) = 0
BopG (AppG (fromList [EmptyG])) LitG

(23,9)-(23,35)
if rand (0 , 1) = 0
then buildX ()
else buildY ()
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(23,10)-(23,16)
rand
VarG

(23,10)-(23,16)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(23,10)-(23,16)
0
LitG

(23,10)-(23,16)
1
LitG

(23,10)-(23,16)
0
LitG

(23,10)-(23,16)
(0 , 1)
TupleG (fromList [LitG])

(25,6)-(28,74)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,AppG (fromList [EmptyG]))])

(25,7)-(25,16)
rand
VarG

(25,7)-(25,16)
buildSine (build (rand , depth - 1))
AppG (fromList [AppG (fromList [EmptyG])])

(25,7)-(25,16)
0
LitG

(25,7)-(25,16)
4
LitG

(25,7)-(25,16)
(0 , 4)
TupleG (fromList [LitG])

*)
