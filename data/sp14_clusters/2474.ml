
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
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then expr ^ ("Sine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
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
  buildhelper rand (1, 4) depth "";;


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
(11,11)-(11,20)
e1
VarG

(11,11)-(11,20)
e2
VarG

(11,11)-(11,20)
e
VarG

(11,11)-(11,20)
e
VarG

(11,11)-(11,20)
a
VarG

(11,11)-(11,20)
b
VarG

(11,11)-(11,20)
a_less
VarG

(11,11)-(11,20)
b_less
VarG

(11,11)-(11,20)
e1
VarG

(11,11)-(11,20)
e2
VarG

(11,11)-(11,20)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG [VarG,VarG])) Nothing)

(11,11)-(11,20)
fun e -> Cosine e
LamG (ConAppG (Just VarG) Nothing)

(11,11)-(11,20)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(11,11)-(11,20)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG [VarG,VarG,VarG,VarG])) Nothing)

(11,11)-(11,20)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG [VarG,VarG])) Nothing)

(11,11)-(11,20)
Average (e1 , e2)
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(11,11)-(11,20)
Cosine e
ConAppG (Just VarG) Nothing

(11,11)-(11,20)
Sine e
ConAppG (Just VarG) Nothing

(11,11)-(11,20)
Thresh (a , b , a_less , b_less)
ConAppG (Just (TupleG [VarG,VarG,VarG,VarG])) Nothing

(11,11)-(11,20)
Times (e1 , e2)
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(17,4)-(45,45)
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
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]

(21,13)-(21,17)
buildSine
VarG

(21,13)-(21,17)
buildhelper
VarG

(21,13)-(21,17)
buildhelper 0 0 expr
AppG [LitG,LitG,VarG]

(21,13)-(21,17)
0
LitG

(21,13)-(21,17)
0
LitG

(21,18)-(21,19)
buildSine (buildhelper 0 0
                       expr)
AppG [AppG [EmptyG,EmptyG,EmptyG]]

(21,32)-(21,64)
buildCosine
VarG

(21,47)-(21,58)
expr
VarG

(21,47)-(21,58)
rand
VarG

(21,47)-(21,58)
buildAverage
VarG

(21,47)-(21,58)
buildhelper
VarG

(21,47)-(21,58)
rand (0 , 1)
AppG [TupleG [EmptyG,EmptyG]]

(21,47)-(21,58)
buildAverage (buildhelper (depth - 1)
                          (depth - 1)
                          expr , buildhelper (depth - 1)
                                             (depth - 1)
                                             expr)
AppG [TupleG [EmptyG,EmptyG]]

(21,47)-(21,58)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(21,47)-(21,58)
rand (0 , 1) = 0
BopG (AppG [EmptyG]) LitG

(21,47)-(21,58)
0
LitG

(21,47)-(21,58)
0
LitG

(21,47)-(21,58)
1
LitG

(21,47)-(21,58)
0
LitG

(21,47)-(21,58)
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
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (AppG [EmptyG])

(21,47)-(21,58)
(0 , 1)
TupleG [LitG,LitG]

(21,47)-(21,58)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(21,59)-(21,63)
depth
VarG

(21,59)-(21,63)
depth - 1
BopG VarG LitG

(21,59)-(21,63)
1
LitG

(21,65)-(21,66)
buildCosine (buildhelper 0 0
                         expr)
AppG [AppG [EmptyG,EmptyG,EmptyG]]

(22,13)-(22,17)
buildhelper
VarG

(22,13)-(22,17)
depth
VarG

(22,13)-(22,17)
depth
VarG

(22,13)-(22,17)
depth - 1
BopG VarG LitG

(22,13)-(22,17)
depth - 1
BopG VarG LitG

(22,13)-(22,17)
1
LitG

(22,13)-(22,17)
1
LitG

(22,18)-(22,19)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(22,34)-(22,66)
buildTimes
VarG

(22,34)-(22,66)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(22,61)-(22,65)
depth
VarG

(22,61)-(22,65)
depth - 1
BopG VarG LitG

(22,61)-(22,65)
1
LitG

(22,67)-(22,68)
buildTimes (buildhelper (depth - 1)
                        (depth - 1)
                        expr , buildhelper (depth - 1)
                                           (depth - 1) expr)
AppG [TupleG [EmptyG,EmptyG]]

(22,69)-(22,72)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(24,8)-(33,64)
buildhelper
VarG

(24,8)-(33,64)
depth
VarG

(24,8)-(33,64)
depth
VarG

(24,8)-(33,64)
expr
VarG

(24,8)-(33,64)
depth - 1
BopG VarG LitG

(24,8)-(33,64)
depth - 1
BopG VarG LitG

(24,8)-(33,64)
1
LitG

(24,8)-(33,64)
1
LitG

(28,16)-(28,56)
buildAverage
VarG

(28,16)-(28,56)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(28,30)-(28,33)
depth
VarG

(28,57)-(28,58)
buildAverage (buildhelper (depth - 1)
                          (depth - 1)
                          expr , buildhelper (depth - 1)
                                             (depth - 1)
                                             expr)
AppG [TupleG [EmptyG,EmptyG]]

(29,40)-(29,43)
depth
VarG

(31,10)-(31,14)
buildTimes
VarG

(31,10)-(31,14)
buildhelper
VarG

(31,10)-(31,14)
depth
VarG

(31,10)-(31,14)
depth
VarG

(31,10)-(31,14)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(31,10)-(31,14)
depth - 1
BopG VarG LitG

(31,10)-(31,14)
depth - 1
BopG VarG LitG

(31,10)-(31,14)
1
LitG

(31,10)-(31,14)
1
LitG

(31,10)-(31,14)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(31,15)-(31,16)
buildTimes (buildhelper (depth - 1)
                        (depth - 1)
                        expr , buildhelper (depth - 1)
                                           (depth - 1) expr)
AppG [TupleG [EmptyG,EmptyG]]

(32,27)-(32,30)
depth
VarG

(33,16)-(33,19)
buildThresh (buildhelper (depth - 1)
                         (depth - 1)
                         expr , buildhelper (depth - 1)
                                            (depth - 1)
                                            expr , buildhelper (depth - 1)
                                                               (depth - 1)
                                                               expr , buildhelper (depth - 1)
                                                                                  (depth - 1)
                                                                                  expr)
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(33,22)-(33,62)
buildThresh
VarG

(33,22)-(33,62)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(33,36)-(33,39)
depth
VarG

(34,11)-(34,15)
buildhelper
VarG

(34,11)-(34,15)
depth
VarG

(34,11)-(34,15)
depth
VarG

(34,11)-(34,15)
depth - 1
BopG VarG LitG

(34,11)-(34,15)
depth - 1
BopG VarG LitG

(34,11)-(34,15)
1
LitG

(34,11)-(34,15)
1
LitG

(34,16)-(34,17)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(34,32)-(34,35)
depth
VarG

(34,41)-(34,46)
depth - 1
BopG VarG LitG

(34,47)-(34,51)
1
LitG

(36,8)-(36,12)
buildhelper
VarG

(36,8)-(36,12)
depth
VarG

(36,8)-(36,12)
depth
VarG

(36,8)-(36,12)
depth - 1
BopG VarG LitG

(36,8)-(36,12)
depth - 1
BopG VarG LitG

(36,8)-(36,12)
1
LitG

(36,8)-(36,12)
1
LitG

(36,13)-(36,14)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(38,14)-(38,54)
buildThresh
VarG

(38,14)-(38,54)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(38,34)-(38,35)
depth
VarG

(38,37)-(38,48)
1
LitG

(38,55)-(38,56)
buildThresh (buildhelper (depth - 1)
                         (depth - 1)
                         expr , buildhelper (depth - 1)
                                            (depth - 1)
                                            expr , buildhelper (depth - 1)
                                                               (depth - 1)
                                                               expr , buildhelper (depth - 1)
                                                                                  (depth - 1)
                                                                                  expr)
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(40,40)-(40,41)
depth
VarG

(40,43)-(40,54)
1
LitG

(42,46)-(42,47)
depth
VarG

(42,49)-(42,60)
1
LitG

(44,52)-(44,53)
depth
VarG

(44,55)-(44,66)
1
LitG

(46,2)-(46,34)
buildhelper (rand (1 , 4))
            depth ""
AppG [AppG [EmptyG],VarG,LitG]

(46,14)-(46,18)
rand (1 , 4)
AppG [TupleG [EmptyG,EmptyG]]

*)
