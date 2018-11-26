
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildCosine (buildhelper 0 (depth - 1) expr)
        else expr ^ ("Cosine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
    | 2 ->
        if (rand (0, 1)) = 0
        then
          expr ^
            ("((" ^
               ((buildhelper (num - 1) (depth - 1) expr) ^
                  ("+" ^ ((buildhelper (num - 1) (depth - 1) expr) ^ ")/2)"))))
        else
          expr ^
            ((buildhelper (num - 1) (depth - 1) expr) ^
               ("*" ^ (buildhelper (num - 1) (depth - 1) expr)))
    | 3 -> expr ^ (buildhelper (num - 1) depth expr)
    | 4 ->
        expr ^
          ("(" ^
             ((buildhelper (num - 2) (depth - 1) expr) ^
                ("<" ^
                   ((buildhelper (num - 2) (depth - 1) expr) ^
                      ("?" ^
                         ((buildhelper (num - 2) (depth - 1) expr) ^
                            (":" ^
                               ((buildhelper (num - 2) (depth - 1) expr) ^
                                  ")")))))))) in
  let num = rand (1, 4) in buildhelper num depth "";;


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
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildSine (buildhelper 0 0 expr)
        else buildCosine (buildhelper 0 0 expr)
    | 2 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
    | 3 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
    | 4 ->
        buildThresh
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr))
    | _ ->
        buildThresh
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr)) in
  buildhelper (rand (1, 4)) depth "";;

*)

(* changed spans
(11,16)-(11,28)
e1
VarG

(11,16)-(11,28)
e2
VarG

(11,16)-(11,28)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(11,16)-(11,28)
Average (e1 , e2)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(13,11)-(13,20)
e
VarG

(13,11)-(13,20)
a
VarG

(13,11)-(13,20)
b
VarG

(13,11)-(13,20)
a_less
VarG

(13,11)-(13,20)
b_less
VarG

(13,11)-(13,20)
e1
VarG

(13,11)-(13,20)
e2
VarG

(13,11)-(13,20)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(13,11)-(13,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(13,11)-(13,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(13,11)-(13,20)
Sine e
ConAppG (Just VarG) Nothing

(13,11)-(13,20)
Thresh (a , b , a_less , b_less)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(13,11)-(13,20)
Times (e1 , e2)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(19,4)-(47,45)
match num with
| 0 -> if rand (0 , 1) = 0
       then buildX ()
       else buildY ()
| 1 -> if rand (0 , 1) = 0
       then buildSine (buildhelper 0
                                   0 expr)
       else buildCosine (buildhelper 0
                                     0 expr)
| 2 -> if rand (0 , 1) = 0
       then buildAverage (buildhelper (depth - 1)
                                      (depth - 1)
                                      expr , buildhelper (depth - 1)
                                                         (depth - 1)
                                                         expr)
       else buildTimes (buildhelper (depth - 1)
                                    (depth - 1)
                                    expr , buildhelper (depth - 1)
                                                       (depth - 1)
                                                       expr)
| 3 -> if rand (0 , 1) = 0
       then buildAverage (buildhelper (depth - 1)
                                      (depth - 1)
                                      expr , buildhelper (depth - 1)
                                                         (depth - 1)
                                                         expr)
       else buildTimes (buildhelper (depth - 1)
                                    (depth - 1)
                                    expr , buildhelper (depth - 1)
                                                       (depth - 1)
                                                       expr)
| 4 -> buildThresh (buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr , buildhelper (depth - 1)
                                                                                         (depth - 1)
                                                                                         expr)
| _ -> buildThresh (buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr , buildhelper (depth - 1)
                                                                                         (depth - 1)
                                                                                         expr)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,IteG EmptyG EmptyG EmptyG)])

(23,13)-(23,24)
buildSine
VarG

(23,13)-(23,24)
buildhelper
VarG

(23,13)-(23,24)
expr
VarG

(23,13)-(23,24)
buildhelper 0 0 expr
AppG (fromList [VarG,LitG])

(23,13)-(23,24)
buildCosine (buildhelper 0 0
                         expr)
AppG (fromList [AppG (fromList [EmptyG])])

(23,13)-(23,24)
0
LitG

(23,13)-(23,24)
0
LitG

(23,40)-(23,51)
expr
VarG

(23,40)-(23,51)
rand
VarG

(23,40)-(23,51)
buildAverage
VarG

(23,40)-(23,51)
buildhelper
VarG

(23,40)-(23,51)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,40)-(23,51)
buildAverage (buildhelper (depth - 1)
                          (depth - 1)
                          expr , buildhelper (depth - 1)
                                             (depth - 1)
                                             expr)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,40)-(23,51)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(23,40)-(23,51)
rand (0 , 1) = 0
BopG (AppG (fromList [EmptyG])) LitG

(23,40)-(23,51)
0
LitG

(23,40)-(23,51)
0
LitG

(23,40)-(23,51)
1
LitG

(23,40)-(23,51)
0
LitG

(23,40)-(23,51)
if rand (0 , 1) = 0
then buildAverage (buildhelper (depth - 1)
                               (depth - 1)
                               expr , buildhelper (depth - 1)
                                                  (depth - 1)
                                                  expr)
else buildTimes (buildhelper (depth - 1)
                             (depth - 1)
                             expr , buildhelper (depth - 1)
                                                (depth - 1)
                                                expr)
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(23,40)-(23,51)
(0 , 1)
TupleG (fromList [LitG])

(23,40)-(23,51)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG (fromList [AppG (fromList [EmptyG])])

(23,52)-(23,56)
depth
VarG

(23,52)-(23,56)
depth - 1
BopG VarG LitG

(23,52)-(23,56)
1
LitG

(24,13)-(24,17)
buildhelper
VarG

(24,13)-(24,17)
depth
VarG

(24,13)-(24,17)
depth
VarG

(24,13)-(24,17)
depth - 1
BopG VarG LitG

(24,13)-(24,17)
depth - 1
BopG VarG LitG

(24,13)-(24,17)
1
LitG

(24,13)-(24,17)
1
LitG

(24,18)-(24,19)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(24,34)-(24,66)
buildTimes
VarG

(24,34)-(24,66)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG (fromList [AppG (fromList [EmptyG])])

(24,61)-(24,65)
depth
VarG

(24,61)-(24,65)
depth - 1
BopG VarG LitG

(24,61)-(24,65)
1
LitG

(24,67)-(24,68)
buildTimes (buildhelper (depth - 1)
                        (depth - 1)
                        expr , buildhelper (depth - 1)
                                           (depth - 1) expr)
AppG (fromList [TupleG (fromList [EmptyG])])

(24,69)-(24,72)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(26,8)-(35,64)
buildhelper
VarG

(26,8)-(35,64)
depth
VarG

(26,8)-(35,64)
depth
VarG

(26,8)-(35,64)
expr
VarG

(26,8)-(35,64)
depth - 1
BopG VarG LitG

(26,8)-(35,64)
depth - 1
BopG VarG LitG

(26,8)-(35,64)
1
LitG

(26,8)-(35,64)
1
LitG

(30,16)-(30,56)
buildAverage
VarG

(30,16)-(30,56)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG (fromList [AppG (fromList [EmptyG])])

(30,30)-(30,33)
depth
VarG

(30,57)-(30,58)
buildAverage (buildhelper (depth - 1)
                          (depth - 1)
                          expr , buildhelper (depth - 1)
                                             (depth - 1)
                                             expr)
AppG (fromList [TupleG (fromList [EmptyG])])

(31,40)-(31,43)
depth
VarG

(33,10)-(33,14)
buildTimes
VarG

(33,10)-(33,14)
buildhelper
VarG

(33,10)-(33,14)
depth
VarG

(33,10)-(33,14)
depth
VarG

(33,10)-(33,14)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(33,10)-(33,14)
depth - 1
BopG VarG LitG

(33,10)-(33,14)
depth - 1
BopG VarG LitG

(33,10)-(33,14)
1
LitG

(33,10)-(33,14)
1
LitG

(33,10)-(33,14)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG (fromList [AppG (fromList [EmptyG])])

(33,15)-(33,16)
buildTimes (buildhelper (depth - 1)
                        (depth - 1)
                        expr , buildhelper (depth - 1)
                                           (depth - 1) expr)
AppG (fromList [TupleG (fromList [EmptyG])])

(34,27)-(34,30)
depth
VarG

(35,16)-(35,19)
buildThresh (buildhelper (depth - 1)
                         (depth - 1)
                         expr , buildhelper (depth - 1)
                                            (depth - 1)
                                            expr , buildhelper (depth - 1)
                                                               (depth - 1)
                                                               expr , buildhelper (depth - 1)
                                                                                  (depth - 1)
                                                                                  expr)
AppG (fromList [TupleG (fromList [EmptyG])])

(35,22)-(35,62)
buildThresh
VarG

(35,22)-(35,62)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr)
TupleG (fromList [AppG (fromList [EmptyG])])

(35,36)-(35,39)
depth
VarG

(36,11)-(36,15)
buildhelper
VarG

(36,11)-(36,15)
depth
VarG

(36,11)-(36,15)
depth
VarG

(36,11)-(36,15)
depth - 1
BopG VarG LitG

(36,11)-(36,15)
depth - 1
BopG VarG LitG

(36,11)-(36,15)
1
LitG

(36,11)-(36,15)
1
LitG

(36,16)-(36,17)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(36,32)-(36,35)
depth
VarG

(36,41)-(36,46)
depth - 1
BopG VarG LitG

(36,47)-(36,51)
1
LitG

(38,8)-(38,12)
buildhelper
VarG

(38,8)-(38,12)
depth
VarG

(38,8)-(38,12)
depth
VarG

(38,8)-(38,12)
depth - 1
BopG VarG LitG

(38,8)-(38,12)
depth - 1
BopG VarG LitG

(38,8)-(38,12)
1
LitG

(38,8)-(38,12)
1
LitG

(38,13)-(38,14)
buildhelper (depth - 1)
            (depth - 1) expr
AppG (fromList [VarG,BopG EmptyG EmptyG])

(40,14)-(40,54)
buildThresh
VarG

(40,14)-(40,54)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr)
TupleG (fromList [AppG (fromList [EmptyG])])

(40,34)-(40,35)
depth
VarG

(40,37)-(40,48)
1
LitG

(40,55)-(40,56)
buildThresh (buildhelper (depth - 1)
                         (depth - 1)
                         expr , buildhelper (depth - 1)
                                            (depth - 1)
                                            expr , buildhelper (depth - 1)
                                                               (depth - 1)
                                                               expr , buildhelper (depth - 1)
                                                                                  (depth - 1)
                                                                                  expr)
AppG (fromList [TupleG (fromList [EmptyG])])

(42,40)-(42,41)
depth
VarG

(42,43)-(42,54)
1
LitG

(44,46)-(44,47)
depth
VarG

(44,49)-(44,60)
1
LitG

(46,52)-(46,53)
depth
VarG

(46,55)-(46,66)
1
LitG

(48,2)-(48,51)
buildhelper (rand (1 , 4))
            depth ""
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

(48,12)-(48,23)
buildhelper
VarG

*)
