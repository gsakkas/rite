
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

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then (if (rand mod 2) = 0 then buildX () else buildY ())
  else
    if (rand mod 5) = 0
    then buildSine (build (rand, (depth - 1)))
    else
      if (rand mod 5) = 1
      then buildCosine (build (rand, (depth - 1)))
      else
        if (rand mod 5) = 2
        then
          buildAverage
            ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
        else
          if (rand mod 5) = 3
          then buildAverage (build (rand, (depth - 1)))
          else
            if (rand mod 5) = 4 then buildThresh (build (rand, (depth - 1)));;


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
  if depth <= 0
  then buildX ()
  else
    (match rand (0, 4) with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 2))), (build (rand, (depth - 2))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 4))), (build (rand, (depth - 4))),
             (build (rand, (depth - 4))), (build (rand, (depth - 4))))
     | _ -> buildY ());;

*)

(* changed spans
(19,11)-(19,20)
e1
VarG

(19,11)-(19,20)
e2
VarG

(19,11)-(19,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG [VarG,VarG])) Nothing)

(19,11)-(19,20)
Times (e1 , e2)
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(24,5)-(24,14)
depth <= 0
BopG VarG LitG

(25,48)-(25,57)
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
| 3 -> buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
| 4 -> buildThresh (build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
| _ -> buildY ()
CaseG (AppG [EmptyG]) [(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]

(27,17)-(27,18)
(0 , 4)
TupleG [LitG,LitG]

(28,9)-(28,46)
4
LitG

(36,36)-(36,37)
2
LitG

(38,13)-(38,25)
2
LitG

(38,14)-(38,18)
buildTimes
VarG

(38,14)-(38,18)
build
VarG

(38,14)-(38,18)
buildTimes (build (rand , depth - 2) , build (rand , depth - 2))
AppG [TupleG [EmptyG,EmptyG]]

(38,14)-(38,18)
build (rand , depth - 2)
AppG [TupleG [EmptyG,EmptyG]]

(38,14)-(38,18)
(build (rand , depth - 2) , build (rand , depth - 2))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(38,14)-(38,18)
(rand , depth - 2)
TupleG [VarG,BopG EmptyG EmptyG]

(38,28)-(38,29)
depth - 2
BopG VarG LitG

(39,15)-(39,27)
build
VarG

(39,15)-(39,55)
depth
VarG

(39,15)-(39,55)
2
LitG

(39,28)-(39,55)
rand
VarG

(39,28)-(39,55)
depth
VarG

(39,28)-(39,55)
depth - 2
BopG VarG LitG

(39,28)-(39,55)
2
LitG

(39,28)-(39,55)
(rand , depth - 2)
TupleG [VarG,BopG EmptyG EmptyG]

(39,29)-(39,34)
buildThresh
VarG

(39,29)-(39,34)
build (rand , depth - 4)
AppG [TupleG [EmptyG,EmptyG]]

(39,29)-(39,34)
(build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

(41,12)-(41,76)
buildY
VarG

(41,12)-(41,76)
buildY ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

(41,15)-(41,27)
4
LitG

(41,16)-(41,20)
build
VarG

(41,16)-(41,20)
build (rand , depth - 4)
AppG [TupleG [EmptyG,EmptyG]]

(41,16)-(41,20)
(rand , depth - 4)
TupleG [VarG,BopG EmptyG EmptyG]

(41,25)-(41,26)
depth - 4
BopG VarG LitG

(41,30)-(41,31)
depth
VarG

(41,37)-(41,48)
build
VarG

(41,49)-(41,76)
rand
VarG

(41,49)-(41,76)
depth
VarG

(41,49)-(41,76)
depth - 4
BopG VarG LitG

(41,49)-(41,76)
4
LitG

(41,49)-(41,76)
(rand , depth - 4)
TupleG [VarG,BopG EmptyG EmptyG]

(41,72)-(41,73)
4
LitG

*)
