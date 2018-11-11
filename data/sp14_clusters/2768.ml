
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
        then buildAverage (build (rand, (depth - 1)))
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

(33,11)-(33,23)
buildAverage (build (rand , depth - 2) , build (rand , depth - 2))
AppG [TupleG [EmptyG,EmptyG]]

(33,12)-(33,16)
buildAverage
VarG

(33,12)-(33,16)
build
VarG

(33,12)-(33,16)
build (rand , depth - 2)
AppG [TupleG [EmptyG,EmptyG]]

(33,12)-(33,16)
(build (rand , depth - 2) , build (rand , depth - 2))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(33,12)-(33,16)
(rand , depth - 2)
TupleG [VarG,BopG EmptyG EmptyG]

(33,21)-(33,22)
depth - 2
BopG VarG LitG

(33,26)-(33,27)
depth
VarG

(34,13)-(34,25)
build
VarG

(34,26)-(34,53)
rand
VarG

(34,26)-(34,53)
depth
VarG

(34,26)-(34,53)
depth - 2
BopG VarG LitG

(34,26)-(34,53)
2
LitG

(34,26)-(34,53)
(rand , depth - 2)
TupleG [VarG,BopG EmptyG EmptyG]

(34,27)-(34,32)
buildTimes
VarG

(34,27)-(34,32)
build (rand , depth - 2)
AppG [TupleG [EmptyG,EmptyG]]

(34,27)-(34,32)
(build (rand , depth - 2) , build (rand , depth - 2))
TupleG [AppG [EmptyG],AppG [EmptyG]]

(36,13)-(36,25)
2
LitG

(36,14)-(36,18)
build
VarG

(36,14)-(36,18)
build (rand , depth - 2)
AppG [TupleG [EmptyG,EmptyG]]

(36,14)-(36,18)
(rand , depth - 2)
TupleG [VarG,BopG EmptyG EmptyG]

(36,28)-(36,29)
depth - 2
BopG VarG LitG

(37,15)-(37,27)
buildThresh
VarG

(37,15)-(37,55)
depth
VarG

(37,15)-(37,55)
2
LitG

(37,28)-(37,55)
(build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4) , build (rand , depth - 4))
TupleG [AppG [EmptyG],AppG [EmptyG],AppG [EmptyG],AppG [EmptyG]]

(39,12)-(39,76)
buildY
VarG

(39,12)-(39,76)
buildY ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

(39,15)-(39,27)
4
LitG

(39,16)-(39,20)
build
VarG

(39,16)-(39,20)
build (rand , depth - 4)
AppG [TupleG [EmptyG,EmptyG]]

(39,16)-(39,20)
(rand , depth - 4)
TupleG [VarG,BopG EmptyG EmptyG]

(39,25)-(39,26)
depth - 4
BopG VarG LitG

(39,30)-(39,31)
depth
VarG

(39,37)-(39,48)
build
VarG

(39,49)-(39,76)
rand
VarG

(39,49)-(39,76)
depth
VarG

(39,49)-(39,76)
depth - 4
BopG VarG LitG

(39,49)-(39,76)
4
LitG

(39,49)-(39,76)
(rand , depth - 4)
TupleG [VarG,BopG EmptyG EmptyG]

(39,72)-(39,73)
4
LitG

*)
